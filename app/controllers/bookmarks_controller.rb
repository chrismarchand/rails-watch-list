class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    #retrouve l'instance pour recréer l url bookmark new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@bookmark)
    else
      render :new
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
