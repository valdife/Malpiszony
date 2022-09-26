Rails.application.routes.draw do
  devise_for :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :employee do  
    get "/employees/sign_out" => "devise/sessions#destroy"     
  end
  # Defines the root path route ("/")
  root "public#home"

  scope 'admin', module: 'admin', as: 'admin' do
    resources :reservations, :events, :enclosures
    resources :dashboard, only: [:index]
    resources :animals do
      resources :notes, except: [:index]
    end
  end

  resources :reservations, only: [:new, :create]
end
