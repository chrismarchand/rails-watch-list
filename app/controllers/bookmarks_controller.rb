class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    #retrouve l'instance pour recréer l url bookmark new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(@bookmark.list_id)
    @bookmark.delete
    redirect_to list_path(@list)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
