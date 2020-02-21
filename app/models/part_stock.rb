# == Schema Information
#
# Table name: part_stocks
#
#  id                :bigint           not null, primary key
#  notes             :text
#  quantity_on_hand  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  part_id           :bigint           not null
#  stock_location_id :bigint           not null
#
# Indexes
#
#  index_part_stocks_on_part_id            (part_id)
#  index_part_stocks_on_stock_location_id  (stock_location_id)
#
# Foreign Keys
#
#  fk_rails_...  (part_id => parts.id)
#  fk_rails_...  (stock_location_id => stock_locations.id)
#

class PartStock < ApplicationRecord
  belongs_to :stock_location
  belongs_to :part
end
