Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controller: {
      sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
    post 'users/guest_executive_sign_in', to: 'users/sessions#guest_executive_sign_in'
    post 'users/guest_general_sign_in', to: 'users/sessions#guest_general_sign_in'
  end

  root 'tops#index'
  resources :users
  resources :schools
  resources :favorites
  #root 'schools#index' 
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
