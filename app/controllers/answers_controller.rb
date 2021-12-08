class AnswersController < ApplicationController
    def create
        question = Question.find(params[:question_id])
        answer = question.answers.build(answer_params)
        answer.user_id = current_user.id
        if answer.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path)
        end
    end

    private

    def answer_params
        params.require(:answer).permit(:content)
    end



end