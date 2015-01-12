class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
    # render plain: "Hello"
  end

  def new
    # render plain: "new"
    @creature = Creature.new
  end

  def create

    #render plain: "create"
    #render json: params
    #@creature = Creature.new(params.require(:creature).permit(:name, :desc))
    # @creatures.save
    # redirect_to "/show"

    #using .new method
    # @creature = Creature.new
    # @creature.name = params[:creature][:name]
    # @creature.desc = params[:creature][:desc]
    # @creature.save
    # redirect_to creatures_path

    #create method
    # creature_params = params.require(:creature).permit(:name, :desc)
    # Creature.create(creature_params)

    # redirect_to creatures_path

    # @creature = Creature.create(creature_params)
    @creature = Creature.new(creature_params)
    if @creature.save
      redirect_to @creature #creatures_path
    else
      render 'new'
    end

  end

  def show
    #render plain: "show"
    @creature = Creature.find_by_id(params[:id]) #@creature = Creature.find(params[:id])
    not_found unless @creature

    list= flickr.photos.search :text => @creature.name, :sort => "relevance"
       @results = list.map do |photo|
       FlickRaw.url_s(photo)
     end
  end

  # def results

  #   @search = params[:search]
  #   list= flickr.photos.search :text => @search, :sort => "relevance"

  #   @results = list.map do |photo|
  #     FlickRaw.url_s(photo)
  #   end

  # end

  def edit
    #rend plain: "edit"
    @creature = Creature.find(params[:id])
  end

  def update
    @creature = Creature.find(params[:id])

    if @creature.update(params[:creature].permit(:name, :desc))
      redirect_to @creature
    else
      render 'edit'
    end
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
