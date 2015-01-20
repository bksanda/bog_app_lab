class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all

  end

  def new
    @creature = Creature.new
    @tags = Tag.all
  end

  def create
    @creature = Creature.create(creature_params)
    @tags = Tag.all

    if @creature.errors.any?
      render 'new'

    else

      @creature.tags.clear
      tags = params[:creature][:tag_ids]

      tags.each do |tag_id|
        @creature.tags << Tag.find(tag_id) unless tag_id.blank?
      end

      flash[:success] = "Your creature has been added"
      redirect_to creatures_path

    end
  end

  def show
    @creature = Creature.find_by_id(params[:id]) #@creature = Creature.find(params[:id])

    not_found unless @creature

    list= flickr.photos.search :text => @creature.name, :sort => "relevance"
       @results = list.map do |photo|
       FlickRaw.url_s(photo)
     end
  end

  def tag
    tag = Tag.find_by_name(params[:tag])
    @creatures = tag ? tag.creatures : []
  end

  def edit
    #rend plain: "edit"
    @creature = Creature.find(params[:id])
    @tags = Tag.all

  end

  def update
    #return render json: params[:creature][:tag_ids]
    @creature = Creature.find_by_id(params[:id])
    @creature.name = params[:creature][:name]
    @creature.desc = params[:creature][:desc]
    @creature.save

    @creature.tags.clear
    tags = params[:creature][:tag_ids]

    tags.each do |tag_id|
      @creature.tags << Tag.find(tag_id) unless tag_id.blank?
    end

    redirect_to creatures_path
  end

  def destroy
    @creature = Creature.find(params[:id])
    @creature.destroy

    redirect_to creatures_path
  end


  private

  def creature_params
    params.require(:creature).permit(:name, :desc)
  end

end
