# == Schema Information
#
# Table name: supplier_parts
#
#  id                   :bigint           not null, primary key
#  notes                :text
#  part_number          :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  manufacturer_part_id :bigint
#  part_id              :bigint           not null
#  supplier_id          :bigint           not null
#
# Indexes
#
#  index_supplier_parts_on_manufacturer_part_id  (manufacturer_part_id)
#  index_supplier_parts_on_part_id               (part_id)
#  index_supplier_parts_on_supplier_id           (supplier_id)
#
# Foreign Keys
#
#  fk_rails_...  (manufacturer_part_id => manufacturer_parts.id)
#  fk_rails_...  (part_id => parts.id)
#  fk_rails_...  (supplier_id => suppliers.id)
#

class SupplierPart < ApplicationRecord
  belongs_to :supplier
  belongs_to :part
  belongs_to :manufacturer_part, optional: true
end
