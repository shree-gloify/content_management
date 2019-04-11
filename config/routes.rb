Rails.application.routes.draw do
	
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'home#show'

  # scope :api, defaults: { format: :json } do
  #   devise_for :users
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
