Rails.application.routes.draw do
  root 'job#index'
  get '/jobs/:search', to: 'job#search_jobs'

  devise_for :users, :controllers => { registrations: 'registrations' }
end
