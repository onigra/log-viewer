LogViewer::Application.routes.draw do
  root :to => "slow_logs#index"

  resources :slow_logs do
    get "stock", :on => :member
  end
end
