Rails.application.routes.draw do
  get 'sessions/entrar'
  get 'sessions/cadastrar'
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/403', to: 'errors#access_denied'

  get 'dashboard/index'
  get 'home' => 'home_index#index'

  resources :usuarios, except: %i[index destroy]
  resources :documentos do
    member do
      get :gerar_relatorio
      get :mostrar_relatorio
    end
  end

  root 'dashboard#index'
end
