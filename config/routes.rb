ArchSer::Application.routes.draw do

  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/help"

  resources :surveys do
    collection do
      get 'vote'
    end
  end

  get '/surveys/vote/:id', :to => 'surveys#vote'

  get '/admin', :to => 'admins#view'

  get '/admin/data', :to => 'admins#data'

  get '/admin/dbaction', :to => 'admins#dbaction'

  get '/', :to => 'surveys#index'

  get '/logout', :to => 'sessions#destroy'

  match '/auth/:provider/callback', :to => 'sessions#create'

  match '/auth/failure', :to => 'sessions#failure'

end
