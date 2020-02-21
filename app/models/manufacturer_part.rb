# == Schema Information
#
# Table name: manufacturer_parts
#
#  id              :bigint           not null, primary key
#  notes           :text
#  part_number     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  manufacturer_id :bigint           not null
#  part_id         :bigint           not null
#
# Indexes
#
#  index_manufacturer_parts_on_manufacturer_id  (manufacturer_id)
#  index_manufacturer_parts_on_part_id          (part_id)
#
# Foreign Keys
#
#  fk_rails_...  (manufacturer_id => manufacturers.id)
#  fk_rails_...  (part_id => parts.id)
#

class ManufacturerPart < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :part
end
