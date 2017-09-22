class PagesController < ApplicationController

before_filter :check_login, :only => [:index]

  def index

  end

  def show
  end
end
