# == Schema Information
#
# Table name: stock_locations
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  parts_count :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class StockLocation < ApplicationRecord
end
