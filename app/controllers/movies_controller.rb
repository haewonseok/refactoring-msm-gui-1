class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_movie = Movie.find(the_id)

    render({ :template => "movie_templates/show" })
  end

  def create
    @the_movie = Movie.new
    @the_movie.title = params.fetch("query_title")
    @the_movie.year = params.fetch("query_year")
    @the_movie.duration = params.fetch("query_duration")
    @the_movie.description = params.fetch("query_description")
    @the_movie.image = params.fetch("query_image")
    @the_movie.director_id = params.fetch("query_director_id")

    @the_movie.save

    redirect_to("/movies")
  end

  def update
    the_id = params.fetch("path_id")
    @the_movie = Movie.find(the_id)

    @the_movie.title = params.fetch("query_title")
    @the_movie.year = params.fetch("query_year")
    @the_movie.duration = params.fetch("query_duration")
    @the_movie.description = params.fetch("query_description")
    @the_movie.image = params.fetch("query_image")
    @the_movie.director_id = params.fetch("query_director_id")

    @the_movie.save

    redirect_to("/movies/#{@the_movie.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_movie = Movie.find(the_id)

    @the_movie.destroy

    redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end
end
