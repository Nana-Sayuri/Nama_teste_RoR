Rails.application.routes.draw do
  resources :infos
  resource :sales
  root "infos#index"
end
