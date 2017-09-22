class EpisodesController < ApplicationController

	before_filter :check_login

	def index
		@episodes = Episode.search(params[:search])
	end

	def show
  		@episode = Episode.find(params[:id])
	end

	def new
		@episode = Episode.new
	end


	def create
		@episode = Episode.new(params[:Episode])
		if 	@episode.save
			redirect_to '/Episodes'
		end
	end

	def edit
		@episode = Episode.find(params[:id])
	end

	def update
		@episode = Episode.find(params[:id])
		if @episode.update_attributes(params[:Episode])
         redirect_to :action => 'show', :id => @episode
      	else
         @episode = Episode.find(:all)
         render :action => 'edit'
      	end
	end

	def destroy
		@episode = Episode.find(params[:id])
		@episode.destroy
		redirect_to '/Episodes', :notice => "Your Episode has been deleted"
	end



end