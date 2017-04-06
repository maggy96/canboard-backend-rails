Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'api' do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :boards, only: [:index, :show, :create, :destroy] do
        resources :lists, only: [:index, :show, :create, :destroy] do
          resources :cards, only: [:index, :show, :create, :destroy]
        end
      end

      mount_devise_token_auth_for 'User', at: 'auth'
      # devise_for :users, controllers: {
      #   sessions: 'users/sessions'
      # }
    end
  end

  # Catchall for actually serving the html/js/css files from the frontend
  match ':file' => 'static#show', via: [:get, :post, :put], :constraints => {:file => /.*/}

end
