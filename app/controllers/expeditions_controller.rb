class ExpeditionsController < ApplicationController

  before_action :find_expedition, only: %i[show edit update destroy]

  def index
    authorize Expedition
    @expeditions = Expedition.all
  end

  def show
    @spaceship = Spaceship.new
  end
  
  def new
    authorize Expedition
    @expedition = Expedition.new
  end

  def create
    authorize Expedition
    @expedition = Expedition.new(expedition_params)

    if @expedition.save
      redirect_to @expedition
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @expedition.update(expedition_params)
      redirect_to @expedition
    else
      render :edit
    end
  end

  def destroy
    @expedition.destroy
    redirect_to expeditions_path
  end

  private

  def find_expedition
    @expedition = Expedition.find(params[:id])
    authorize @expedition
  end

  def expedition_params
    params.require(:expedition).permit(:title, :description)
  end

end
