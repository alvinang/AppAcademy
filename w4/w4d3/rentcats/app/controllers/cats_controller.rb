class CatsController < ApplicationController

  before_filter :find_cat, only: [:edit, :show, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_url
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  def destroy
    @cat.destroy
    redirect_to cats_url
  end

  private

  def cat_params
    valid = params.require(:cat).permit(:age, :name, :color, :birth_date, :sex, :user_id)
    valid[:user_id] = current_user.id
    valid
  end

  def find_cat
    @cat = Cat.find(params[:id])
  end

end
