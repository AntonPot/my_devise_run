class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    # p "$"*99
    # p @survey
    # redirect_to root_path
  end

  def new
    survey = Survey.new

  end
end
