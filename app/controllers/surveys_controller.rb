class SurveysController < ApplicationController
  before_action :fetch_survey, only: [:edit, :update, :show]

  def index
    @surveys = Survey.all.order('created_at desc')
    # @survey = Survey.all.order('created_at desc').includes(:question).page(params[:page]||1).per(20)
  end

  def show
  end

  def new
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      4.times { question.answers.build }
      2.times { question.options.build }
    end
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      # flash[:notice] = 'successful'
      redirect_to surveys_path, notice: "Successfully created survey."
    else
      flash[:alert] = @survey.errors.full_messages.join('')
      render :action => 'new'
    end

  end

  def update
    if @survey.update_attributes(survey_params)
      # flash[:ntice] = 'successfully updated'
      redirect_to @survey, notice: "Successfully updated survey."
    else
      flash[:alert] = @survey.errors.full_messages.join('')
      render :action => 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    # flash[:notice] = 'successful'
    redirect_to surveys_url, notice: "Successfully destroyed survey."
  end

  private
  def survey_params
    params.require(:survey).permit(:name,
       questions_attributes: [:id, :title, :survey_id,
         answers_attributes:[:id, :content, :question_id], options_attributes: [:id, :content, :question_id]])
  end

  def fetch_survey
    @survey = Survey.find(params[:id])
  end

end
