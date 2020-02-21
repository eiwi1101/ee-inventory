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
#  package_id        :bigint           not null
#
# Indexes
#
#  index_parts_on_package_id  (package_id)
#
# Foreign Keys
#
#  fk_rails_...  (package_id => packages.id)
#

class Part < ApplicationRecord
  belongs_to :package

  validates_presence_of :name
end
