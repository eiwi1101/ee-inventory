module Types
  class PackageType < Types::BaseObject
    description "A part package or footprint"

    field :id, Integer, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :height, Integer, null: true
    field :length, Integer, null: true
    field :width, Integer, null: true
    field :dimension_unit, String, null: true
    field :surface_mount, Boolean, null: true
  end
end