Rails.application.routes.draw do
  
  # get 'subs/index', :to => 'subs#index'
  root 'subs#index'
  
  get "/stinkyfeet", :to => 'subs#index'
  
  resources :subs do
    resources :topics
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
