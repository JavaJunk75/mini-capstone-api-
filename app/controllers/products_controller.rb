class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def create
    @product = Product.create(
      name: params[:name], 
      price: params[:price],
      image_url: params[:image_url], 
      description: params[:description],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    render :show
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end
  
  def update
    @product = Product.update(
      name: params[:name] || @product.name, 
      price: params[:price] || @product.price,
      image_url: params[:image_url] || @product.image_url,
      description: params[:description] || @product.description,
      created_at: params[:created_at] || @product.created_at,
      updated_at: params[:updated_at] || @product.updated_at
    )
    render :show
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product destroyed succesfully!"}
  end

end