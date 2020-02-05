class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def show
    @question = Question.find(params["id"])
    @answer = Answer.new
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

  def edit
    @question = Question.find(params["id"])
  end

  def update
    @question = Question.find(params["id"])
    @question.update(question_params)

    if @question.save
      flash[:notice] = "Question has been updated!"
      redirect_to @question
    else
      flash.now[:notice]= @question.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @question = Question.find(params["id"])
    @question.answers.destroy
    @question.destroy
    redirect_to questions_path
  end


  private

  def question_params
    params.require(:question).permit([:title, :description])
  end

end
