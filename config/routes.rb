Rails.application.routes.draw do
  mount Monopoly::Api => '/api'

  get '*path', to: 'home#index'
  root to: 'home#index'
end
