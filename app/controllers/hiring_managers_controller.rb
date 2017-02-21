class HiringManagersController < ApplicationController
  before_action { authenticate 'advisor' }
  before_action :set_company
  before_action :set_hiring_manager, only: [:show, :edit, :update, :destroy]

  # GET /hiring_managers
  # GET /hiring_managers.json
  def index
    @hiring_managers = @company.hiring_managers.all
  end

  # GET /hiring_managers/1
  # GET /hiring_managers/1.json
  def show
  end

  # GET /hiring_managers/new
  def new
    @hiring_manager = HiringManager.new
    @hiring_manager.user = User.new
  end

  # GET /hiring_managers/1/edit
  def edit
  end

  # POST /hiring_managers
  # POST /hiring_managers.json
  def create
    @hiring_manager = HiringManager.new(hiring_manager_params)
    @hiring_manager.user.password = 'placeholder to be reset'
    @hiring_manager.company = @company
    if @hiring_manager.save
      redirect_to [@company, @hiring_manager], notice: 'Hiring manager was successfully created.'
    else
       render :new
      end
  end

  # PATCH/PUT /hiring_managers/1
  # PATCH/PUT /hiring_managers/1.json
  def update
    if @hiring_manager.update(hiring_manager_params)
      redirect_to [@company, @hiring_manager], notice: 'Hiring manager was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hiring_managers/1
  # DELETE /hiring_managers/1.json
  def destroy
    @hiring_manager.destroy
      redirect_to company_hiring_managers_path(@company), notice: 'Hiring manager was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_hiring_manager
      @hiring_manager = @company.hiring_managers.includes(:user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hiring_manager_params
      params.require(:hiring_manager).permit(:user_id, :company_id, :position,
          user_attributes: [:first_name, :last_name, :email])
    end
end
