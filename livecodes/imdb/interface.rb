require_relative 'scraper'
require 'yaml'

filepath = 'movies.yml'

puts 'Scraping top 5 urls from IMDB...'
urls = scrape_top_5_urls

puts 'Scraping movie details from IMDB...'
movies = urls.map { |url| scrape_movie_info(url) }

File.open(filepath, 'wb') do |f|
  f.write(YAML.dump(movies))
end