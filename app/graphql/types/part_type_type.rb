module Types
  class PartTypeType < Types::BaseObject
    graphql_name "PartType"
    description 'A type of a part'

    field :id, Integer, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :category, Types::CategoryType, null: false
  end
end
