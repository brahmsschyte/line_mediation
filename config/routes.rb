require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope '/api' do
    scope '/v1' do
      resources :line_events, only: [:index]
      resources :mogi_tracks, only: [:index]
      resources :mbp_tracks,  only: [:index]
      resources :sms_delivery_reports, only: [:index]
    end
  end

  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  post 'line/:key/callback',  to: 'line_webhook#callback'
  post 'mogi/:key/callback',  to: 'mogi_webhook#callback'
  post 'mbp/:key/callback',   to: 'mbp_webhook#callback'
  post 'sms/:key/callback',   to: 'sms_webhook#callback'
  get  'sms/delivery_report', to: 'sms_webhook#delivery_report'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
