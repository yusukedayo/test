class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:success] = "コメントしました"
    else
      flash[:success] = "コメントできませんでした"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
