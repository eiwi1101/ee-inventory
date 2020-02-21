# == Schema Information
#
# Table name: order_parts
#
#  id                :bigint           not null, primary key
#  amount_cents      :integer
#  notes             :text
#  quantity_on_order :integer
#  total_cents       :integer
#  total_currency    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  order_id          :bigint           not null
#  part_id           :bigint           not null
#
# Indexes
#
#  index_order_parts_on_order_id  (order_id)
#  index_order_parts_on_part_id   (part_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (part_id => parts.id)
#

class OrderPart < ApplicationRecord
  belongs_to :order
  belongs_to :part
end
