class SchoolsController < ApplicationController
  before_action :set_school, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /schools or /schools.json
  def index
    @schools = School.all
    @q = School.ransack(params[:q])
    @schools = @q.result.page(params[:page]).per(10)
    @subjects = Subject.all
  end

  # GET /schools/1 or /schools/1.json
  def show
    if current_user
      @favorite = current_user.favorites.find_by(school_id: @school.id)
    else
      redirect_to new_user_session_path
    end  
  end

  # GET /schools/new
  def new
    if current_user.role == "executive"
      @school = School.new
    else current_user.role == "general"
      redirect_to(schools_path)
    end  
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools or /schools.json
  def create
    @school = current_user.schools.build(school_params)
    respond_to do |format|
      if @school.save
        format.html { redirect_to school_url(@school), notice: "School was successfully created." }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to school_url(@school), notice: "School was successfully updated." }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1 or /schools/1.json
  def destroy
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url, notice: "School was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
  def set_school
    @school = School.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def school_params
    params.require(:school).permit(:name, :prefecture, :city, :phone, :overview, :image, :id, { handling_subject_ids: [] })
  end
end
