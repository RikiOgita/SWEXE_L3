Rails.application.routes.draw do
    resources :tweet
    root 'tweet#index'
    get 'get_tweet/:id', to: 'tweet#get_tweet'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
