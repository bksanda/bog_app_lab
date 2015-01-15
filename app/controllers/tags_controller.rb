class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.all
    @tag = Tag.create(tag_params)

    redirect_to tags_path
  end

  def show
  end

  def edit
    @tag = Tag.find_by_name(params[:tag])
  end

  def update
  end

  def destroy
    @tag = Tag.find(params[:id])
    # @tag.destroy

    if (@tag.creatures.length == 0)
        @tag.destroy
    else
      flash[:notice] = "You can't delete! " + @tag.creatures.length.to_s + " or more creatures have this tag."
    end

    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end


end

