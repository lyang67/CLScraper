Rails.application.routes.draw do
  get 'about/about'
  root 'craigslist#craigslist'
  get 'show_listings/Show'
  get 'craigslist/craigslist'
  get 'welcome/index'


  get '/search', to: 'craigslist#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
