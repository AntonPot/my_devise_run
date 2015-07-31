class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
  end
end
