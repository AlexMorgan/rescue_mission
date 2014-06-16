class AnswersController < ApplicationController
  def index
    @answers = Answer.order(created_at: :desc)
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Your answer has been submitted"
      redirect_to questions_path
    else
      flash[:notice] = "Something went wrong!"
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end
