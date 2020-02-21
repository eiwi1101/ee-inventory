# == Schema Information
#
# Table name: project_parts
#
#  id                :bigint           not null, primary key
#  notes             :text
#  quantity_required :integer
#  symbols           :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  part_id           :bigint           not null
#  project_id        :bigint           not null
#
# Indexes
#
#  index_project_parts_on_part_id     (part_id)
#  index_project_parts_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (part_id => parts.id)
#  fk_rails_...  (project_id => projects.id)
#

class ProjectPart < ApplicationRecord
  belongs_to :project
  belongs_to :part
end
