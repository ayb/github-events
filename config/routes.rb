Rails.application.routes.draw do
  root to: "queries#new"
  resources :queries, only: [:new, :create, :show]
end
