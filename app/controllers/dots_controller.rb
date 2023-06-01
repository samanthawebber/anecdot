class DotsController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @dots = Dot.all
  end

  def show
  end

  def new
    @dot = Dot.new
  end

  def create
    @dot = Dot.new(dot_params)

    if @dot.save
      redirect_to dots_path, notice: "You successfully created your dot!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @dot.update(dot_params)
      redirect_to dots_path, notice: "You successfully updated your dot!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dot.destroy
    redirect_to dots_path, notice: "You successfully destroyed your dot."
  end

  private

  def set_dot
    @dot = Dot.find(params[:id])
  end

  def dot_params
    params.require(:dot).permit(:name)
  end
end
