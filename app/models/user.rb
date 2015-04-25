class User < ActiveRecord::Base
  has_many :blogs
  has_many :comments

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  attr_reader :password
  before_save :format_user_input

  def password=(unencrypted_password)
    unless unencrypted_password.empty?
    @password = unencrypted_password
    self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(self.password_digest) == unencrypted_password
      self
    else
      false
    end
  end

  private

  def format_user_input
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
    self.username = self.username.downcase
    self.email = self.email.downcase
  end

end
