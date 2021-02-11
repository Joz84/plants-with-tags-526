class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
    # render view
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # @tag = Tag.find(params[:plant_tag][:tag])
    # @plant_tag = PlantTag.new(plant: @plant, tag: @tag )
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new
    # end
    @tags = Tag.where(id: params[:plant_tag][:tag] )
    @tags.each do |tag|
      @plant_tag = PlantTag.create(plant: @plant, tag: tag )
    end

    # params[:plant_tag][:tag].each do |tag_id|
    #   @tag = Tag.find(tag_id)
    #   @plant_tag = PlantTag.create(plant: @plant, tag: @tag )
    # end

    redirect_to garden_path(@plant.garden)
  end
end
