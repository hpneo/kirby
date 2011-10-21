Kirby::Application.routes.draw do

  resources :publishers do
    resources :series
  end
  resources :series
  resources :issues

  root :to => 'home#welcome'

end