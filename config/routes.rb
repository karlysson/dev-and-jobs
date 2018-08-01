Rails.application.routes.draw do
  resources :professionals
  devise_for :users, :controllers => { registrations: 'registrations' }
end
