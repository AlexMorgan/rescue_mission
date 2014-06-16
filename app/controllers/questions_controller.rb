class QuestionsController < ApplicationController
  def index
    @questions = Question.order(updated_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(question_id: @question).order(created_at: :desc)
  end

  def edit
    @question = Question.find(params[:id])
  end


 def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      # Same as redirect_to action: 'show', id: => @question
      redirect_to question_path
    else
      flash[:notice] = "Something went wrong!"
      render :new
    end
 end

  # Get the form for the new article
  def new
    @question = Question.new
  end

  # Posts the information from the form and creates a new question
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Your question has been submitted"
      redirect_to questions_path
    else
      flash[:notice] = "Something went wrong!"
      render :new
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(
      :title,:description)
  end

end
