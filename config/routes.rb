Rails.application.routes.draw do

  # Root Route

  root 'blogs#index'

  # User Routes

  get 'users/' => 'users#index'

  get 'signup' => 'users#new', as: :signup

  post 'users/' => 'users#create'

  get 'users/:id/edit' => 'users#edit', as: :edit_user

  patch 'users/:id' => 'users#update'

  get 'users/:id' => 'users#show', as: :user

  delete 'users/:id' => 'users#destroy'

  #Blog Routes

  get 'blogs/' => 'blogs#index'

  get 'blogs/:id/edit' => 'blogs#edit', as: :edit_blog
  
  get 'blogs/new' => 'blogs#new', as: :new_blog

  post 'blogs/' => 'blogs#create'

  get 'blogs/:id' => 'blogs#show', as: :blog

  patch 'blogs/:id' => 'blogs#update'

  delete 'blogs/:id' => 'blogs#destroy'


  # Comment Routes

  post 'blogs/:id/comments' => 'comments#create', as: :blog_comments

  delete 'comments/:id/' => "comments#destroy", as: :delete_comment


  # Login Routes

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  
  # Static Pages Routes

  get 'welcome' => 'static_pages#welcome'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'
end
