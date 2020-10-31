class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
  
    def search
        @movies=Movie.where("movie_name LIKE?" ,params[:q])
        end
    def show
    end
    def index
        @movies=Movie.all
        if params[:search]
            @search_term=params[:search]
            @movies=@movies.search_by(@search_term)
        end
    end
    def new
        @movie=Movie.new
    end
    def edit
    end
     def create
        @movie=Movie.new(movie_params)
        @movie.user=current_user
       if  @movie.save
        flash[:notice]="Movie was created successfully"
        redirect_to @movie
       else
        render 'new'
     end
     end

     def update
    if @movie.update(movie_params)
      flash[:notice]="Movie was updated successfully"
         redirect_to @movie
        else
         render 'edit'
      end
     end
     def destroy
    @movie.destroy
        redirect_to movies_path
    end

    private 
    def set_movie
        @movie=Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:movie_name,:description,:actor_name,:director_name,:movie_language,:show_time)
    end

    def require_same_user
        if current_user != @movie.user && !current_user.admin?
          flash[:alert] = "You can only view the movie"
          redirect_to @movie
        end
      end
end