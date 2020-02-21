# == Schema Information
#
# Table name: property_types
#
#  id                 :bigint           not null, primary key
#  description        :text
#  name               :string
#  numeric            :boolean
#  property_unit      :string
#  property_unit_name :string
#  variable           :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  part_type_id       :bigint           not null
#
# Indexes
#
#  index_property_types_on_part_type_id  (part_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (part_type_id => part_types.id)
#

class PropertyType < ApplicationRecord
  belongs_to :part_type
end
