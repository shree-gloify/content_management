Rails.application.routes.draw do
	
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'home#show'
  get 'search' => 'home#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :projects, only: [:create] do
      	resources :release_notes, only: [:create]
      end
      
      resources :release_notes, only: [:index] do
        resources :release_comments, only: [:create]
      end
    end
  end
end
