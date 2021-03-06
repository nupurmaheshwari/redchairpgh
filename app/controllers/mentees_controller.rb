class MenteesController < ApplicationController
  # before_action :check_login
  before_action :set_mentee, only: [:show, :edit, :update, :destroy, :matches, :pause, :update_pause]
  authorize_resource
  
  # GET /mentees
  # GET /mentees.json
  def index
    @mentees = Mentee.all
  end

  # GET /mentees/1
  # GET /mentees/1.json
  def show
  end

  # GET /mentees/new
  def new
    @mentee = Mentee.new
  end

  # GET /mentees/1/edit
  def edit
  end

  def matches 
  end
  
  def pause 
  end 
  
  def update_pause 
    puts "MENTE PAUSED?"
    puts @mentee.paused
    if @mentee.paused 
      @mentee.update_attributes(:paused => false) 
    else 
      @mentee.update_attributes(:paused => true) 
    end 
    redirect_to mentee_matches_path(@mentee)
  end 
    
  # POST /mentees
  # POST /mentees.json
  def create
    @mentee = Mentee.new(mentee_params)

    respond_to do |format|
      if @mentee.save
        format.html { redirect_to @mentee, notice: 'Successfully created mentee profile.' }
        format.json { render :show, status: :created, location: @mentee }
      else
        format.html { render :new }
        format.json { render json: @mentee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mentees/1
  # PATCH/PUT /mentees/1.json
  def update
    respond_to do |format|
      if @mentee.update(mentee_params)
        format.html { redirect_to @mentee, notice: 'Mentee was successfully updated.' }
        format.json { render :show, status: :ok, location: @mentee }
      else
        format.html { render :edit, notice: 'Mentor cannot be updated.' }
        format.json { render json: @mentee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mentees/1
  # DELETE /mentees/1.json
  def destroy
    @mentee.destroy
    respond_to do |format|
      format.html { redirect_to mentees_url, notice: 'Mentee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentee
      @mentee = Mentee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mentee_params
      params.require(:mentee).permit(:user_id, :is_active, :current_role, :mentor_role, :skill_1, :skill_2, :skill_3, :years_in_field, :lead_team, :mentor_gender, :comm_frequency, :bio, :in_five_years)
    end
end
