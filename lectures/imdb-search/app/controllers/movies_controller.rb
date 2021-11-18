class MoviesController < ApplicationController
  def index
    @movies =
      if params[:query].present?
        query = <<-SQL
        title @@ :q
        OR synopsis @@ :q
        OR directors.first_name @@ :q
        OR directors.last_name @@ :q
        SQL
        Movie.joins(:director).where(query, q: "%#{params[:query]}%")
      else
        Movie.all
      end
  end
end