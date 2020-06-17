# RecordGroups controller
class RecordGroupsController < ApplicationController
  before_action :set_record_group, only: %i[show edit update destroy]

  # GET /record_groups
  # GET /record_groups.json
  def index
    @record_groups = RecordGroup.all.includes(:record_groups)
  end

  # GET /record_groups/1
  # GET /record_groups/1.json
  def show; end

  # GET /record_groups/new
  def new
    @record_group = RecordGroup.new
  end

  # GET /record_groups/1/edit
  def edit; end

  # POST /record_groups
  # POST /record_groups.json
  def create
    @record_group = RecordGroup.new(record_group_params)

    respond_to do |format|
      if @record_group.save
        format.html { redirect_to @record_group, notice: 'Record group was successfully created.' }
        format.json { render :show, status: :created, location: @record_group }
      else
        format.html { render :new }
        format.json { render json: @record_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /record_groups/1
  # PATCH/PUT /record_groups/1.json
  def update
    respond_to do |format|
      if @record_group.update(record_group_params)
        format.html { redirect_to @record_group, notice: 'Record group was successfully updated.' }
        format.json { render :show, status: :ok, location: @record_group }
      else
        format.html { render :edit }
        format.json { render json: @record_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_groups/1
  # DELETE /record_groups/1.json
  def destroy
    @record_group.destroy
    respond_to do |format|
      format.html { redirect_to record_groups_url, notice: 'Record group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record_group
    @record_group = RecordGroup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def record_group_params
    params.require(:record_group).permit(:record_id, :group_id)
  end
end
