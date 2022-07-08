class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy update_all]

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  def assign_all
    @activity = Activity.new
    @activities = Activity.all
  end

  def update_all
    @activity = Activity.new(activity_params)
    # Gr
    begin
      ActiveRecord::Base.transaction do
        byebug
        Group.all.each do |group|
          group_activity = GroupActivity.new
          group_activity.amount = @activity.amount
          group_activity.group_id = group.id
          group_activity.activity_id = @activity.id
          group_activity.observation = "Creado por SISTEMA"
          group_activity.user_id = current_user.id
          group_activity.save!
        end
        respond_to do |format|
          format.html { redirect_to activities_path, notice: "Actividades fueron asignadas correctamente." }
        end
      end
    rescue ActiveRecord::RecordInvalid
      respond_to do |format|
        format.html { redirect_to assign_all_activities_path, notice: "Error al crear Datos." }
      end
    end
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:name, :description, :rules, :code, :date_init, :date_end, :amount, :is_close, :state, :is_visible, :event_id)
    end
end
