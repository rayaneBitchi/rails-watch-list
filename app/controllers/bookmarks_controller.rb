class BookmarksController < ApplicationController
    def index
        @list = List.find(params[:list_id])
        @movies = @list.movies
    end

    def new
        raise
    end
end
