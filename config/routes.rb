Rails.application.routes.draw do
  resources :odots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todo_lists
end
