class Api::BrandsController < ApplicationController

  def index
    @brands = Brand.all.includes(:products)

    render :index
  end

  def new
    @brand = Brand.new
    render :new
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to :index
    else
      flash.now[:errors] = @brand.errors.full_messages
      render :new
    end
  end

  def show
    @brand = Brand.find(params[:id])

    render :show
  end

  def edit
    @brand = Brand.find(params[:id])
    render :edit
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.update(brand_params)

    redirect_to :index
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to brand_url
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end

end
