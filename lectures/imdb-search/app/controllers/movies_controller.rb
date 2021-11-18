class MoviesController < ApplicationController
  def index
    @movies =
      if params[:query].present?
        # # Active Record

        # query = <<-SQL
        # title @@ :q
        # OR synopsis @@ :q
        # OR directors.first_name @@ :q
        # OR directors.last_name @@ :q
        # SQL
        # Movie.joins(:director).where(query, q: "%#{params[:query]}%")

        # # PgSearch

        # Movie.global_search(params[:query])
        PgSearch.multisearch(params[:query])
      else
        Movie.all
      end
  end
end
