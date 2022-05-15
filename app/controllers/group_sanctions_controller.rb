class GroupSanctionsController < ApplicationController
  before_action :set_group_sanction, only: %i[ show edit update destroy ]

  # GET /group_sanctions or /group_sanctions.json
  def index
    @group_sanctions = GroupSanction.all
  end

  # GET /group_sanctions/1 or /group_sanctions/1.json
  def show
  end

  # GET /group_sanctions/new
  def new
    @group_sanction = GroupSanction.new
  end

  # GET /group_sanctions/1/edit
  def edit
  end

  # POST /group_sanctions or /group_sanctions.json
  def create
    @group_sanction = GroupSanction.new(group_sanction_params)

    respond_to do |format|
      if @group_sanction.save
        format.html { redirect_to group_sanction_url(@group_sanction), notice: "Group sanction was successfully created." }
        format.json { render :show, status: :created, location: @group_sanction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_sanction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_sanctions/1 or /group_sanctions/1.json
  def update
    respond_to do |format|
      if @group_sanction.update(group_sanction_params)
        format.html { redirect_to group_sanction_url(@group_sanction), notice: "Group sanction was successfully updated." }
        format.json { render :show, status: :ok, location: @group_sanction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_sanction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_sanctions/1 or /group_sanctions/1.json
  def destroy
    @group_sanction.destroy

    respond_to do |format|
      format.html { redirect_to group_sanctions_url, notice: "Group sanction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_sanction
      @group_sanction = GroupSanction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_sanction_params
      params.require(:group_sanction).permit(:amount, :date_done, :group_id, :sanction_id, :user_id)
    end
end
