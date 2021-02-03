Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'charts#chart'
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }

  resources :activities
  resources :missions

  get 'chart', to: 'charts#chart'
end
