Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope '/api' do
    scope '/v1' do
      resources :line_events, only: [:index]
      resources :mogi_tracks, only: [:index]
    end
  end

  post 'line/:key/callback', to: 'line_webhook#callback'
  post 'mogi/:key/callback', to: 'mogi_webhook#callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
