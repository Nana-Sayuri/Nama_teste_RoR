Rails.application.routes.draw do
  resources :resumes, only: [:index, :new, :create, :destroy, :show]
  root "resumes#index"
  #get 'vendas/import/new', to: 'vendas#new_import'
  #post 'vendas/import', to: 'vendas#import'  
end
