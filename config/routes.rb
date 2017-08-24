Rails.application.routes.draw do
  resources :odots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todo_lists do
    resources :todo_items, only: [:create]
  end

  resources :todo_items, only: [:destroy] do
    member do
      get "/done", to: "todo_items#done"
    end
  end

end
