class SubsController < ApplicationController
  before_action :set_subs, only: [:show, :update, :edit, :destroy]
  
  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @subs = Sub.new
  end

  def create
    @subs = Sub.new(sub_params)
    if @subs.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subs.update(sub_params)
      redirect_to @subs
    else
      redirect :edit
    end
  end

  def destroy
    @subs.destroy
    redirect_to subs_path
  end

private

def set_subs
  @subs = Sub.find(params[:id])
end

def sub_params
  params.require(:sub).permit(:name)
end

end
