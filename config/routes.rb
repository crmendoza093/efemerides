Rails.application.routes.draw do
  health_check_routes

  namespace :v1, defaults: { format: :json } do
    resources :categories
    resources :events
  end
end
