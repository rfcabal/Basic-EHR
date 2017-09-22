class PatientsController < ApplicationController

	before_filter :check_login

	def index
		@patients = Patient.search(params[:search])
	end

	def show
  		@patient = Patient.find(params[:id])
	end

	def new
		@patient = Patient.new
	end


	def create
		@patient = Patient.new(params[:patient])
		if 	@patient.save
			redirect_to '/patients'
		end
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update_attributes(params[:patient])
         redirect_to :action => 'show', :id => @patient
      	else
         @patient = patient.find(:all)
         render :action => 'edit'
      	end
	end

	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		redirect_to '/patients', :notice => "Your patient has been deleted"
	end

end
