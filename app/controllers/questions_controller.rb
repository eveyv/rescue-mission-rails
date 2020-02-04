class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
    # @question = Question.new(params["question"])
  end

  def show
    @question = Question.find(params["id"])
    @answer = Answer.new
  #
    @answers = @question.answers.order(created_at: :asc)
  end

  def new
    @question = Question.new
  end

  def create
    @questions = Question.order('created_at DESC')
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question was created successfully.'
      render :index
    else
      flash.now[:errors] = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit([:title, :description])
  end

end
