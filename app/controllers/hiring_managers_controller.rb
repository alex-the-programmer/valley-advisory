class HiringManagersController < ApplicationController
  before_action :set_hiring_manager, only: [:show, :edit, :update, :destroy]

  # GET /hiring_managers
  # GET /hiring_managers.json
  def index
    @hiring_managers = HiringManager.all
  end

  # GET /hiring_managers/1
  # GET /hiring_managers/1.json
  def show
  end

  # GET /hiring_managers/new
  def new
    @hiring_manager = HiringManager.new
  end

  # GET /hiring_managers/1/edit
  def edit
  end

  # POST /hiring_managers
  # POST /hiring_managers.json
  def create
    @hiring_manager = HiringManager.new(hiring_manager_params)

    respond_to do |format|
      if @hiring_manager.save
        format.html { redirect_to @hiring_manager, notice: 'Hiring manager was successfully created.' }
        format.json { render :show, status: :created, location: @hiring_manager }
      else
        format.html { render :new }
        format.json { render json: @hiring_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hiring_managers/1
  # PATCH/PUT /hiring_managers/1.json
  def update
    respond_to do |format|
      if @hiring_manager.update(hiring_manager_params)
        format.html { redirect_to @hiring_manager, notice: 'Hiring manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @hiring_manager }
      else
        format.html { render :edit }
        format.json { render json: @hiring_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hiring_managers/1
  # DELETE /hiring_managers/1.json
  def destroy
    @hiring_manager.destroy
    respond_to do |format|
      format.html { redirect_to hiring_managers_url, notice: 'Hiring manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hiring_manager
      @hiring_manager = HiringManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hiring_manager_params
      params.require(:hiring_manager).permit(:user_id, :company_id, :position)
    end
end
