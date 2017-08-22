class OdotsController < ApplicationController
  before_action :set_odot, only: [:show, :edit, :update, :destroy]

  # GET /odots
  # GET /odots.json
  def index
    @odots = Odot.all
  end

  # GET /odots/1
  # GET /odots/1.json
  def show
  end

  # GET /odots/new
  def new
    @odot = Odot.new
  end

  # GET /odots/1/edit
  def edit
  end

  # POST /odots
  # POST /odots.json
  def create
    @odot = Odot.new(odot_params)

    respond_to do |format|
      if @odot.save
        format.html { redirect_to @odot, notice: 'Odot was successfully created.' }
        format.json { render :show, status: :created, location: @odot }
      else
        format.html { render :new }
        format.json { render json: @odot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odots/1
  # PATCH/PUT /odots/1.json
  def update
    respond_to do |format|
      if @odot.update(odot_params)
        format.html { redirect_to @odot, notice: 'Odot was successfully updated.' }
        format.json { render :show, status: :ok, location: @odot }
      else
        format.html { render :edit }
        format.json { render json: @odot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odots/1
  # DELETE /odots/1.json
  def destroy
    @odot.destroy
    respond_to do |format|
      format.html { redirect_to odots_url, notice: 'Odot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odot
      @odot = Odot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def odot_params
      params.require(:odot).permit(:title, :description)
    end
end
