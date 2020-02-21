# == Schema Information
#
# Table name: part_usages
#
#  id              :bigint           not null, primary key
#  notes           :text
#  quantity_used   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  part_id         :bigint           not null
#  project_id      :bigint           not null
#  project_part_id :bigint           not null
#
# Indexes
#
#  index_part_usages_on_part_id          (part_id)
#  index_part_usages_on_project_id       (project_id)
#  index_part_usages_on_project_part_id  (project_part_id)
#
# Foreign Keys
#
#  fk_rails_...  (part_id => parts.id)
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (project_part_id => project_parts.id)
#

class PartUsage < ApplicationRecord
  belongs_to :part
  belongs_to :project
  belongs_to :project_part
end
