class QuestionsController < ApplicationController
  def index
    @q = current_user.questions.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def solved
    @q = Question.where(solved: true).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def unsolved
    @q = Question.where(solved: false).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(5)
  end


  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      redirect_to questions_url
    else
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end
  
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      QuestionMailer.creation_email(@question).deliver_now
      redirect_to questions_urlelse
    else
      flash.now[:danger] = '失敗しました'
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :solved, :image)
  end
end