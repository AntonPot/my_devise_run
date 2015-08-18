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
    @survey = Survey.new

  end

  def create
    survey = Survey.new(title: params[:survey][:title], user_id: current_user.id)
    if survey.save
      redirect_to edit_survey(survey)
    else
      flash[:notice] = 'Something went wrong'
      redirect_to root_path
    end
  end

  def edit
    survey = Survey.find(params[:id])
    p "#"*99
    p params

  end

  def update

  end
end
