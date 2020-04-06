class BeadsController < ApplicationController
  helper BeadsDisplayHelper

  def new
    @bead = Bead.new
  end

  def create
    @bead = Bead.new(bead_params)
    if @bead.save
      redirect_to bead_url(@bead)
    else
      render 'new'
    end
  end

  def show
    @bead=Bead.find(params[:id])
  end

  def edit
    @bead = Bead.find(params[:id])
    render 'new'
  end

  def update
    @bead = Bead.find(params[:id])
    #@bead.photo.attach(params[:photo])
    @bead.update(bead_params)
    if @bead.save
      redirect_to bead_url(@bead)
    else
      render 'new'
    end
  end

  def destroy
    Bead.destroy(params[:id])
    redirect_to '/'
  end

  def index
      if params[:search]
        @filter = params["search"]["colors"].reject(&:blank?)
        @beads = @filter.empty? ? Bead.all : Bead.all.tagged_with(@filter, any: true)
      else
        @beads = Bead.all
      end
  end

  private

    def bead_params
      params.require(:bead).permit(:brand,:color_list,:size,:shape,:description,:photo)
    end

end
