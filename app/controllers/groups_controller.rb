class GroupsController < ApplicationController
  def index
    @header = 'Categories'
    @groups = Group.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
    @header = @group.name
  end

  def edit
    @header = 'Edit category'
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to user_group_path(current_user, @group), notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @header = 'New category'
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to user_group_path(current_user, @group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to user_groups_path, notice: 'Group was successfully deleted.'
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
