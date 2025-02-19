Rails.application.routes.draw do
  root 'books#index'
  
  resources :books do
    member do
      post 'borrow'
      post 'return'
    end
  end
  
  resources :borrow_records, only: [:create]
  get 'borrower_history/:borrower_name', to: 'borrow_records#borrower_history', as: 'borrower_history'
end
