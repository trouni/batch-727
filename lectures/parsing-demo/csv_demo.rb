require 'csv'

# READ CSV FILE

# # TODO - let's read/write data from beers.csv
# filepath    = 'data/beers.csv'

# # csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# csv_options = { headers: :first_row }

# CSV.foreach(filepath, csv_options) do |row|
#   puts "#{row['Name']} is a #{row['Appearance']} beer"
# end


# WRITE CSV FILE

csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
filepath    = 'data/beers.csv'

beers = [
  { name: "Edelweiss", appearance: "White", origin: "Austria" },
  { name: "Cuvée des Trolls", appearance: "Blond", origin: "Belgium" },
  { name: "Choulette Ambrée", appearance: "Amber", origin: "France" },
  { name: "Gulden Draak", appearance: "Dark", origin: "Belgium" }
]

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  beers.each do |beer|
    # first beer { name: "Edelweiss", appearance: "White", origin: "Austria" }
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end