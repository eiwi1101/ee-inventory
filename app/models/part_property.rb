# == Schema Information
#
# Table name: part_properties
#
#  id                 :bigint           not null, primary key
#  property_value     :decimal(, )
#  property_value_max :decimal(, )
#  property_value_min :decimal(, )
#  property_value_str :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  part_id            :bigint           not null
#  property_type_id   :bigint           not null
#
# Indexes
#
#  index_part_properties_on_part_id           (part_id)
#  index_part_properties_on_property_type_id  (property_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (part_id => parts.id)
#  fk_rails_...  (property_type_id => property_types.id)
#

class PartProperty < ApplicationRecord
  belongs_to :part
  belongs_to :property_type
end
