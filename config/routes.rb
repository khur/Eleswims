Rails.application.routes.draw do
  # Root Route


  # User Routes

  get 'users/' => 'users#index'

  get 'signup' => 'users#new', as: :signup

  post 'users/' => 'users#create'

  get 'users/:id/edit' => 'users#edit', as: :edit_user

  patch 'users/:id' => 'users#update'

  get 'users/:id' => 'users#show', as: :user

  delete 'users/:id' => 'users#destroy'

  #Blog Routes



  # Comment Routes




end
