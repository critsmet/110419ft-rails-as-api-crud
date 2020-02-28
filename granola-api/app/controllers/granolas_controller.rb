class GranolasController < ApplicationController
  def index
    granolas = Granola.all
    options = {}
    options[:include] = [:brand]
    render json: GranolaSerializer.new(granolas, options)
  end

  def show
    granola = Granola.find_by(params[:id])
    render json: GranolaSerializer.new(granola)
  end

  def create
    newGranola = Granola.create(name: params['name'], description: params['description'])
    render json: GranolaSerializer.new(newGranola)
  end

  def destroy
    granola = Granola.find_by(id: params[:id])
    granola.destroy
  end

end
