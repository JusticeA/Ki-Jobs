Rails.application.routes.draw do
  devise_for :recruiters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs do
    collection do 
      get "/jobs/", to: "jobs#index_rec", as: "rec"
    end 
  end 
  root "jobs#index"
end
