Rails.application.routes.draw do
  root 'cat_pages#index'

  get '/cats/newimage', to: 'cat_pages#serveSingleImage'
  get '/about', to: 'cat_pages#about'
end
