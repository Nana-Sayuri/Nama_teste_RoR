Rails.application.routes.draw do
<<<<<<< HEAD
  resources :sales
  root 'sales#index'
=======
  resources :resumes, only: [:index, :new, :create, :destroy]
  root "resumes#index"
>>>>>>> a4c8540203708fb1f807e31cece412980455454c
end
