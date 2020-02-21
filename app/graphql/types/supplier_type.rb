module Types
  class SupplierType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :website, String, null: true
    field :notes, String, null: false
  end
end