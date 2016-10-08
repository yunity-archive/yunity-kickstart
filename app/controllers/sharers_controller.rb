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

  def signup_confirmation
    @city = params[:city]
    @sharer_count = params[:sharer_count]
    @explanation_text = params[:explanation_text]
  end

  # POST /sharers
  # POST /sharers.json
  def create
    @sharer = Sharer.new(sharer_params)
    @city = sharer_params["city"]

    respond_to do |format|
      if @sharer.save

        
        sharer_count = Sharer.where(city: @city).count
        puts sharer_count

        if sharer_count < 100
          @sharer_count = 100 - sharer_count
          @explanation_text = "We need #{@sharer_count} more sharers to signup in your city before we can start!"
        else
          @sharer_count = sharer_count
          @explanation_text = "Foodsharing has started already in your city. There are #{@sharer_count} share in your city."
        end
        puts @explanation_text
        SignupConfirmationMailer.signup_confirmation_email(@sharer, @explanation_text).deliver # Sends email
        
        format.html { redirect_to :controller => 'sharers', :action => 'signup_confirmation', :city=>@city, :sharer_count=>@sharer_count, :explanation_text=>@explanation_text}
        #format.html { redirect_to '/signup_confirmation'}
      else
        format.js
        #format.html { redirect_to '/landing' }
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
