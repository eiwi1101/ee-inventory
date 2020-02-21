# == Schema Information
#
# Table name: packages
#
#  id             :bigint           not null, primary key
#  description    :text
#  dimension_unit :string
#  height         :integer
#  length         :integer
#  name           :string
#  surface_mount  :boolean
#  width          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Package < ApplicationRecord
  validates_presence_of :name
end
