class QuestionsController < ApplicationController
  def index
    @questions = Question.order(updated_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def create

  end
end
