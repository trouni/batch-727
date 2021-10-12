require 'json'

# READ JSON

# # TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

# serialized_beers = File.read(filepath)

# beers = JSON.parse(serialized_beers)


# WRITE JSON

beers = {
  beers: [
    {
      name:       'Edelweiss',
      appearance: 'White',
      origin:     'Austria'
    },
    {
      name:       'Guinness',
      appearance: 'Stout',
      origin:     'Ireland'
    },
    # etc...
  ]
}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end