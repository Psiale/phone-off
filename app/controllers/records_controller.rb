class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @groups = Group.all
    @amount = Record.pluck(:amount).sum
    @record = current_user.records.build
    @records = Record.all
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = current_user.records.build
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = current_user.records.build(record_params)
    amount = record_params[:amount].to_i
    @record.amount = amount
    @record.amount = (amount * 60) if params[:time] = 'hours'

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end
    # Only allow a list of trusted parameters through.
    def record_params
      params.require(:record).permit(:name, :amount)
    end
end
