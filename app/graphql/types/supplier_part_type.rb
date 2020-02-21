module Types
  class SupplierPartType < Types::BaseObject
    field :id, Integer, null: false
    field :part_number, String, null: true
    field :notes, String, null: true

    field :supplier, Types::SupplierType, null: false
    field :part, Types::PartType, null: false
    field :manufacturer_part, Types::ManufacturerPartType, null: true
  end
end