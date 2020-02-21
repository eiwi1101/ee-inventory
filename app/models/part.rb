# == Schema Information
#
# Table name: parts
#
#  id                :bigint           not null, primary key
#  description       :text
#  name              :string
#  part_number       :string
#  quantity_on_hand  :integer
#  quantity_on_order :integer
#  quantity_ordered  :integer
#  quantity_used     :integer
#  value             :decimal(, )
#  value_unit        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  package_id        :bigint
#  part_type_id      :bigint           not null
#
# Indexes
#
#  index_parts_on_package_id    (package_id)
#  index_parts_on_part_type_id  (part_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (package_id => packages.id)
#  fk_rails_...  (part_type_id => part_types.id)
#
class Part < ApplicationRecord
  VALUE_UNITS = {
      'F' => 'Farad',
      'o' => 'Ohms'
  }.freeze

  belongs_to :package, optional: true
  belongs_to :part_type

  has_one :category, through: :part_type

  has_many :manufacturer_parts
  has_many :manufacturers, through: :manufacturer_parts

  has_many :supplier_parts
  has_many :suppliers, through: :supplier_parts

  has_many :part_stocks
  has_many :stock_locations, through: :part_stocks

  validates_presence_of :name

  def value_unit_name
    VALUE_UNITS[value_unit]
  end
end
