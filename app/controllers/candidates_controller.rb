class CandidatesController < ApplicationController
  before_action only: [:index, :destroy] { authenticate 'advisor' }
  before_action except: [:index, :destroy] { authenticate 'advisor', 'candidate' }
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]

  # GET /candidates
  # GET /candidates.json
  def index
    @candidates = Candidate.all
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
    @candidate.resume = Resume.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.resume.resume_data.nil?
      @candidate.resume = nil
    else
      @candidate.resume.file_name, @candidate.resume.content_type, @candidate.resume.resume_data = extract_file(@candidate.resume.resume_data)
    end

    if current_user.role == 'candidate'
      @candidate.user = current_user
    else
      @candidate.user = User.new do
        first_name = @candidate.first_name,
        last_name = @candidate.last_name,
        email = @candidate.email
      end
    end

    if @candidate.save
       redirect_to (current_user.role == 'candidate' ? root_path : @candidate), notice: 'Candidate was successfully created.'
    else
        render :new
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
      if @candidate.update(candidate_params)
        redirect_to (current_user.role == 'candidate' ? root_path : @candidate), notice: 'Candidate was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    redirect_to candidates_url, notice: 'Candidate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.includes(:user, :resume).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:user_id, :first_name, :last_name, :email, :phone, :desired_position, :current_company, :linked_in_url, :twitter_url, :git_hub_url, :portfolio_url, :website_url,
          resume_attributes:[:resume_data])
    end

    def extract_file(file)
      return file.original_filename, file.content_type, file.read
    end
end
