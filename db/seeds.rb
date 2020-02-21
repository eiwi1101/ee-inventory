# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

file = File.read('tmp/import.csv')
data = CSV.parse(file)
header = data.shift
import = data.collect { |row| header.zip(row).to_h }

import.each do |r|
  category = Category.find_or_create_by!(name: r['Category'])
  part_type = PartType.find_or_initialize_by(name: r['Component'])
  part_type.update!(category: category)

  package = if (footprint = r['Footprint'])
              Package.find_or_create_by!(name: footprint)
            end

  part = Part.create!(
    name: r['Component'],
    package: package,
    part_type: part_type,
    part_number: r['P/N'],
    description: r['Value']
  )

  if (manufacturer_name = r['Manufacturer'])
    manufacturer = Manufacturer.find_or_create_by!(name: manufacturer_name)
    mfg_part = ManufacturerPart.create!(
      manufacturer: manufacturer,
      part: part,
      part_number: r['P/N']
    )
  else
    mfg_part = nil
  end

  if (supplier_name = r['Supplier'])
    supplier = Supplier.find_or_create_by!(name: supplier_name)
    SupplierPart.create!(supplier: supplier, part: part, manufacturer_part: mfg_part)
  end

  if (qty = r['Qty']) || (location_name = r['Location'])
    location = StockLocation.find_or_create_by!(name: location_name || '_default_')
    PartStock.create!(part: part, stock_location: location, quantity_on_hand: qty || 0)
  end
end
