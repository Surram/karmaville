Karmaville::Application.routes.draw do
  resources :users, :only => [:index]

  get "/:page_num" => "users#page_num"
  root :to => 'users#index'
end
