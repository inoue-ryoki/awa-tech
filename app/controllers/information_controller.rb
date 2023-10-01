class InformationController < ApplicationController
  before_action :set_information, only: %i[ show edit update destroy ]

  # GET /information or /information.json
  def index
    @information = Information.all
  end

  # GET /information/1 or /information/1.json
  def show
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information or /information.json
  def create
    @information = Information.new(information_params)

    respond_to do |format|
      if @information.save
        format.html { redirect_to information_url(@information), notice: "Information was successfully created." }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information/1 or /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to information_url(@information), notice: "Information was successfully updated." }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1 or /information/1.json
  def destroy
    @information.destroy

    respond_to do |format|
      format.html { redirect_to information_index_url, notice: "Information was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def information_params
      params.require(:information).permit(:content)
    end
end
