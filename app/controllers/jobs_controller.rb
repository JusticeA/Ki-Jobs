class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_recruiter!, except: [:index, :show, :landing, :search]
  # before_action :authenticate_user!
  def search
    if params[:search].present?
      @jobs = Job.paginate(:page => params[:page], per_page: 10).order("created_at DESC").search params[:search], fields: [:company_name, :title, :details, :location, :requirement, :close_date], match: :word_middle
    else 
      @jobs = Job.paginate(:page => params[:page], per_page: 10).order("created_at DESC")
    end
  end

  def index
    @jobs = Job.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
  end

  def index_rec
    @jobz = current_recruiter.jobs.paginate(:page => params[:page], per_page: 5).order("created_at DESC")
  end 

  def landing
    
  end 
  
  def show
  
  end

  def new 
    @job = current_recruiter.jobs.build()
  end

  def create
    @job = current_recruiter.jobs.build(job_params)
    if @job.save 
      flash[:success] = "Job opening successfully created"
      redirect_to @job
    else
      render "new"
    end 
  end

  def edit 
    
  end
  
  def update
    if @job.update(job_params)
      flash[:success] = "Job posting updated"
      redirect_to @job
    else
      render "edit"
    end 
  end
  
  def destroy
    @job.destroy
    flash[:danger] = "Successfully deleted"
    redirect_to jobs_path
  end
 
  private 

  def find_job
    @job = Job.find(params[:id])
  end
  
  def job_params
    params.require(:job).permit(:title, :details, :location, :requirement, :close_date, :how_to_apply, :company_name, :job_type, :recruiter_id, :user_id)
  end 
end
