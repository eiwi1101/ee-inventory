Rails.application.routes.draw do
  root 'application#show'

  post "/graphql", to: "graphql#execute"

  match '*path', to: 'application#show', via: :all
end
