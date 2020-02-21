module Types
  class StockLocationType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :parts_count, Integer, null: false
    field :part_stocks, [Types::PartStockType], null: true
  end
end