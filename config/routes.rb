GreenMercury::Application.routes.draw do
  resources :mentor_applications
  resources :member_applications
  root 'index#index'
  get '/events', controller: :events, action: :index
  post '/events/rsvp/:id', controller: :events, action: :rsvp, as: :event_rsvp
  get '/events/get_token', controller: :events
  get '/new_applications/index', controller: :new_applications, action: :index, as: :new_application
  get '/new_applications/show', controller: :new_applications, action: :show

  post '/session', controller: :session, action: :acquire_session, as: :acquire_session
  post '/logout', controller: :session, action: :logout, as: :logout

  resources :concepts, except: [:destroy, :edit, :update]
  resources :concept_descriptions, only: [:new, :create, :destroy]
  get '/profile/edit', controller: :profile, action: :edit, as: :edit_profile
  get '/profile/:uuid', controller: :profile, action: :show, as: :show_profile
end
