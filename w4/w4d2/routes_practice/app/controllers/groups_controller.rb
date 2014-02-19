class GroupsController < ApplicationController

  def index
    @groups = Group.where(user_id: params[:user_id])

    render :json => @groups
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = params[:user_id]
    if @group.save
      render :json => @group
    else
      render :json => @group.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    @contacts = Group.find(params[:id]).contacts

    render :json => @contacts
  end

  def update
    @group = Group.find(params[:id])
    @group.name = params[:name]
    if @group.save
      render :json => @group
    else
      render :json => @group.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    destroyed_group = @group.dup
    @group.destroy
    render :json => destroyed_group
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end
