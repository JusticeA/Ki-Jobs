class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_recruiter! 
  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def index_rec
    @jobz = current_recruiter.jobs.all.order("created_at DESC")
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
    redirect_to root_path
  end
 
  private 

  def find_job
    @job = Job.find(params[:id])
  end
  
  def job_params
    params.require(:job).permit(:title, :details, :location, :requirement, :close_date, :how_to_apply, :company_name, :job_type, :recruiter_id)
  end 
end
