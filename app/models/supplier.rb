# == Schema Information
#
# Table name: suppliers
#
#  id         :bigint           not null, primary key
#  name       :string
#  notes      :text
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Supplier < ApplicationRecord
  validates_presence_of :name
end
