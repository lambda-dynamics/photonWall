Rails.application.routes.draw do
  resources :slides do
    collection do
      post 'cleanup'
    end
  end
  resources :decks do
      member do
          get 'display'
          get 'reorder'
      end
  end
  get 'utilities', to: 'welcome#utils', as: :utilities

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
