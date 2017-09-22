class MedicalHistoriesController < ApplicationController

  before_filter :check_login

  def index
    @medical_histories = MedicalHistory.search(params[:search])    
  end

  def show
    @medical_history = MedicalHistory.find(params[:id])
  end
  
end
