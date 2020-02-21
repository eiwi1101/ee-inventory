# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  notes          :text
#  status         :string
#  total_cents    :integer
#  total_currency :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  supplier_id    :bigint
#
# Indexes
#
#  index_orders_on_supplier_id  (supplier_id)
#
# Foreign Keys
#
#  fk_rails_...  (supplier_id => suppliers.id)
#

class Order < ApplicationRecord
  belongs_to :supplier, optional: true
end
