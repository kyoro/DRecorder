DRecorder::Application.routes.draw do
  root :to => 'stamps#new' 
  resources :stamps do
  end
  namespace :stamps do
    post :checkin
  end
  
  resources :members do

  end
end
