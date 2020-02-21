module Types
  class PartType < Types::BaseObject
    description "An individual part"

    field :id, Integer, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :part_number, String, null: true
    field :quantity_on_hand, Integer, null: true
    field :quantity_on_order, Integer, null: true
    field :quantity_ordered, Integer, null: true
    field :quantity_used, Integer, null: true
    field :value, Integer, null: true
    field :value_unit, String, null: true
    field :value_unit_name, String, null: true

    field :category, Types::CategoryType, null: false
    field :part_type, Types::PartTypeType, null: false
    field :package, Types::PackageType, null: true
    field :supplier_parts, [Types::SupplierPartType], null: true
    field :manufacturer_parts, [Types::ManufacturerPartType], null: false
    field :suppliers, [Types::SupplierType], null: true
    field :manufacturers, [Types::ManufacturerType], null: true
    field :stock_locations, [Types::StockLocationType], null: true
    field :part_stocks, [Types::PartStockType], null: true
  end
end
