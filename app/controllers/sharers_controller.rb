class SharersController < ApplicationController
  before_action :set_sharer, only: [:show, :edit, :update, :destroy]

  # GET /sharers
  # GET /sharers.json
  def index
    @sharers = Sharer.all
  end

  # GET /sharers/1
  # GET /sharers/1.json
  def show
  end

  # GET /sharers/new
  def new
    @sharer = Sharer.new
  end

  # GET /sharers/1/edit
  def edit
  end

  # POST /sharers
  # POST /sharers.json
  def create
    @sharer = Sharer.new(sharer_params)

    respond_to do |format|
      if @sharer.save
        format.html { redirect_to @sharer, notice: 'Sharer was successfully created.' }
        format.json { render :show, status: :created, location: @sharer }
      else
        format.html { render :new }
        format.json { render json: @sharer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sharers/1
  # PATCH/PUT /sharers/1.json
  def update
    respond_to do |format|
      if @sharer.update(sharer_params)
        format.html { redirect_to @sharer, notice: 'Sharer was successfully updated.' }
        format.json { render :show, status: :ok, location: @sharer }
      else
        format.html { render :edit }
        format.json { render json: @sharer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharers/1
  # DELETE /sharers/1.json
  def destroy
    @sharer.destroy
    respond_to do |format|
      format.html { redirect_to sharers_url, notice: 'Sharer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sharer
      @sharer = Sharer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sharer_params
      params.require(:sharer).permit(:name, :email, :city)
    end
end
