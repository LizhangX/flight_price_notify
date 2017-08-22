Rails.application.routes.draw do
  root 'flights#index'
  post 'flights' => 'flights#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
