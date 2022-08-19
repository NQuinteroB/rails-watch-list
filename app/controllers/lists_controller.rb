class ListsController < ApplicationController

  def index
    @list = List.all
  end

  def new
    @list = List.new

  end

  def show
    @bookmark = Bookmark.new
    # @review = Review.new(list: @list)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
     render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :seeother
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
