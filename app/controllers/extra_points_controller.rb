class ExtraPointsController < ApplicationController
  before_action :set_extra_point, only: %i[ show edit update destroy ]

  # GET /extra_points or /extra_points.json
  def index
    @extra_points = ExtraPoint.all
  end

  # GET /extra_points/1 or /extra_points/1.json
  def show
  end

  # GET /extra_points/new
  def new
    @extra_point = ExtraPoint.new
  end

  # GET /extra_points/1/edit
  def edit
  end

  # POST /extra_points or /extra_points.json
  def create
    @extra_point = ExtraPoint.new(extra_point_params)

    respond_to do |format|
      if @extra_point.save
        format.html { redirect_to extra_point_url(@extra_point), notice: "Extra point was successfully created." }
        format.json { render :show, status: :created, location: @extra_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @extra_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extra_points/1 or /extra_points/1.json
  def update
    respond_to do |format|
      if @extra_point.update(extra_point_params)
        format.html { redirect_to extra_point_url(@extra_point), notice: "Extra point was successfully updated." }
        format.json { render :show, status: :ok, location: @extra_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @extra_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extra_points/1 or /extra_points/1.json
  def destroy
    @extra_point.destroy

    respond_to do |format|
      format.html { redirect_to extra_points_url, notice: "Extra point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra_point
      @extra_point = ExtraPoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def extra_point_params
      params.require(:extra_point).permit(:amount, :name, :description, :event_id)
    end
end
