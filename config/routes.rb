Rails.application.routes.draw do
  get 'relatorio/mostrar_relatorio'
  get 'relatorio/gerar_relatorio'
  get 'relatorio/exportar_relatorio'
  get 'relatorios_controllers/gerar_relatorio'
  get 'relatorios_controllers/mostrar_relatorio'
  get 'relatorios_controllers/exportar_relatorio'

  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/403', to: 'errors#access_denied'

  get 'dashboard/index'
  get 'home' => 'home_index#index'

  devise_for :usuarios, controllers:
    {
      sessions: 'usuarios/sessions',
      registrations: 'usuarios/registrations'
    }

  resources :usuarios, except: %i[create destroy]
  resources :documentos do
    member do
      get :gerar_relatorio
      get :mostrar_relatorio
    end
  end





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'dashboard#index'
end
