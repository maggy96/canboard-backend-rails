Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'api' do
    namespace :v1 do
      resources :users, only: [:index, :show]

      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  # Catchall for actually serving the html/js/css files from the frontend
  match ':file' => 'static#show', via: [:get, :post, :put, :delete], :constraints => {:file => /.*/}

end
