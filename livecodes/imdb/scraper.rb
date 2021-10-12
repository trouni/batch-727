require 'open-uri'
require 'nokogiri'

def scrape_top_5_urls
  url = "https://www.imdb.com/chart/top"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.titleColumn a').first(5).map do |element|
    "https://www.imdb.com#{element.attribute('href').value}"
  end
end

def scrape_movie_info(url)
  html_content = open(url, 'Accept-Language' => 'US-en').read
  doc = Nokogiri::HTML(html_content)

  cast = doc.search('.hTEaNu .eyqFnv').first(3).map { |element| element.text.strip }
  director = doc.search('.ipc-metadata-list-item__content-container').first.text.strip
  storyline = doc.search('.Storyline__StorylineWrapper-sc-1b58ttw-0 .ipc-overflowText').first.text.strip
  title = doc.search('h1').text.strip
  year = doc.search('.TitleBlockMetaData__ListItemText-sc-12ein40-2').first.text.strip.to_i

  {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year
  }
end