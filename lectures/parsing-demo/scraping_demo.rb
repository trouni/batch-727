require 'open-uri'
require 'nokogiri'

ingredient = 'lemon cake'
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.standard-card-new__article-title').each do |element|
  puts element.text.strip # `text` returns the text content of the element
  puts element.attribute('href').value
end