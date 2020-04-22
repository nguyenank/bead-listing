class BeadsController < ApplicationController

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

        temp = Bead.all
        @colorfilter = params[:search][:colors].reject(&:blank?)
        if @colorfilter.any?
          temp = temp.category_search("#{@colorfilter}")
        end

        @brandfilter = params[:search][:brands].reject(&:blank?)
        if @brandfilter.any?
          temp = temp.category_search("#{@brandfilter}")
        end

        @sizefilter = params[:search][:sizes].reject(&:blank?)
        if @sizefilter.any?
          temp = temp.category_search("#{@sizefilter}")
        end

        @shapefilter = params[:search][:shapes].reject(&:blank?)
        if @shapefilter.any?
          temp = temp.category_search("#{@shapefilter}")
        end

        @beads = temp
      else
        @beads = Bead.all
      end
      respond_to do |format|
       format.html
       format.js
     end
  end

  private

    def bead_params
      params.require(:bead).permit(:brand,:color_list,:size,:shape,:description,:photo)
    end

end
