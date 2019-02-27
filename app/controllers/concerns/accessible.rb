module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user 
  end 

  protected

  def check_user
    if current_recruiter
      flash.clear
      redirect_to(new_recruiter_registration_path()) && return
    elsif current_user
      flash.clear
      redirect_to(new_user_registration_path()) && return
    end 
  end 
end 