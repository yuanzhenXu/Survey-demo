class QuestionsController < ApplicationController
  before_action :fetch_question, only: [:show, :edit, :update]

  def index
    @questions = Question.all.order('created_at desc')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'success'
      redirect_to surveys_questions_path
    else
      flash[:alert] = @question.errors.full_messages.join('')
      render action: new
    end
  end

  def edit

  end

  def show

  end

  private
  def fetch_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, answer_atrributes: [:content, :question_id])
  end

end
