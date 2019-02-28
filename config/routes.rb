Rails.application.routes.draw do
  devise_for :users, path: "users", controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
  }
  devise_for :recruiters, path: "recruiters", controllers: {
    sessions: "devise/sessions",
    registrations: "devise/registrations",
    passwords: "devise/passwords",
    confirmations: "devise/confirmations",
    # omniauth_callbacks: "recruiters/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs do
    collection do 
      get "/jobs/", to: "jobs#index_rec", as: "rec"
    end 
  end 
  root "jobs#landing"
end
