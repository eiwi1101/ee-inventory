module Types
  class ManufacturerPartType < Types::BaseObject
    field :id, Integer, null: false
    field :part_number, String, null: true
    field :manufacturer, Types::ManufacturerType, null: false
    field :part, Types::PartType, null: false
  end
end