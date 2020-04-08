module Types
  class CategoryType < Types::BaseObject
    description "Parts category"

    field :id, Integer, null: false
    field :name, String, null: false
    field :part_types, [Types::PartTypeType], null: false
    field :parts, [Types::PartType], null: false
  end
end
