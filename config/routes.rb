Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :tasks do

  end
end
