class GroupExtraPointsController < ApplicationController
  before_action :set_group_extra_point, only: %i[ show edit update destroy ]

  # GET /group_extra_points or /group_extra_points.json
  def index
    @group_extra_points = GroupExtraPoint.all
  end

  # GET /group_extra_points/1 or /group_extra_points/1.json
  def show
  end

  # GET /group_extra_points/new
  def new
    @group_extra_point = GroupExtraPoint.new
  end

  # GET /group_extra_points/1/edit
  def edit
  end

  # POST /group_extra_points or /group_extra_points.json
  def create
    @group_extra_point = GroupExtraPoint.new(group_extra_point_params)
    @group_extra_point.user_id = current_user.id

    respond_to do |format|
      if @group_extra_point.save
        format.html { redirect_to group_extra_point_url(@group_extra_point), notice: "Group extra point was successfully created." }
        format.json { render :show, status: :created, location: @group_extra_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_extra_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_extra_points/1 or /group_extra_points/1.json
  def update
    respond_to do |format|
      if @group_extra_point.update(group_extra_point_params)
        format.html { redirect_to group_extra_point_url(@group_extra_point), notice: "Group extra point was successfully updated." }
        format.json { render :show, status: :ok, location: @group_extra_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_extra_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_extra_points/1 or /group_extra_points/1.json
  def destroy
    @group_extra_point.destroy

    respond_to do |format|
      format.html { redirect_to group_extra_points_url, notice: "Group extra point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_extra_point
      @group_extra_point = GroupExtraPoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_extra_point_params
      params.require(:group_extra_point).permit(:amount, :date_done, :group_id, :extra_point_id)
    end
end
