require_relative '../scraper'

describe '#scrape_top_5_urls' do
  it 'should return an array of 5 urls' do
    top_5_urls = [
      'https://www.imdb.com/title/tt0111161/',
      'https://www.imdb.com/title/tt0068646/',
      'https://www.imdb.com/title/tt0071562/',
      'https://www.imdb.com/title/tt0468569/',
      'https://www.imdb.com/title/tt0050083/'
    ]
    actual = scrape_top_5_urls
    expect(actual).to eq(top_5_urls)
  end
end

describe '#scrape_movie_info' do
  it 'should return a movie hash' do
    url = 'https://www.imdb.com/title/tt0468569/'
    dark_knight = {
      cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
      director: 'Christopher Nolan',
      storyline: "Set within a year after the events of Batman Begins (2005), Batman, Lieutenant James Gordon, and new District Attorney Harvey Dent successfully begin to round up the criminals that plague Gotham City, until a mysterious and sadistic criminal mastermind known only as \"The Joker\" appears in Gotham, creating a new wave of chaos. Batman's struggle against The Joker becomes deeply personal, forcing him to \"confront everything he believes\" and improve his technology to stop him. A love triangle develops between Bruce Wayne, Dent, and Rachel Dawes. —Leon Lombardi",
      title: 'The Dark Knight',
      year: 2008
    }
    expect(scrape_movie_info(url)).to eq(dark_knight)
  end
end