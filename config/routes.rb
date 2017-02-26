Rails.application.routes.draw do
  resources :slides
  resources :decks do
      member do
          get 'display'
          get 'reorder'
      end
  end

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
