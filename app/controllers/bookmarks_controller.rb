class BookmarksController < ApplicationController
    before_action :set_list, only: [:index, :new, :create]
    def index
        @movies = @list.movies
    end

    def new
        @bookmark = Bookmark.new
    end

    def create
        movie = Movie.find(params[:bookmark][:movie_id])
        @bookmark = Bookmark.new(bookmark_parms)
        @bookmark.movie = movie
        @bookmark.list = @list
        @bookmark.save
        redirect_to list_bookmarks_path(@list)
    end

    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy
        redirect_to list_bookmarks_path(@bookmark.list)
    end

    private

    def set_list
        @list = List.find(params[:list_id])
    end

    def bookmark_parms
        params.require(:bookmark).permit(:comment, :movie_id)
    end
end
