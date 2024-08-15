Rails.application.routes.draw do

  get 'dashboard/index'
  get 'home' => 'home_index#index'

  devise_for :usuarios, controllers:
    {
      sessions: 'usuarios/sessions',
      registrations: 'usuarios/registrations'
    }

  resources :usuarios, except: %i[create destroy]



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'dashboard#index'
end
