Rails.application.routes.draw do
  root 'application#show'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"

  match '*path', to: 'application#show', via: :all
end
