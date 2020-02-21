module Types
  class PartStockType < Types::BaseObject
    field :id, Integer, null: false
    field :quantity_on_hand, Integer, null: false
    field :part, Types::PartType, null: false
    field :stock_location, Types::StockLocationType, null: false
  end
end