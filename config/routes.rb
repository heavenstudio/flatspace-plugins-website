FlatspacePlugins::Application.routes.draw do
  match "/auth/facebook/callback" => "sessions#create"
  match "/sign_out" => "sessions#destroy", as: :sign_out

  resources :plugins
  root to: "plugins#index"
end
