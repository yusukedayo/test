class QuestionMailer < ApplicationMailer
    default to: -> {User.pluck(:email)},
    from: "tsunemi0217@icloud.com"
    def creation_email(question)
        @question = question
        mail(
            subject:"質問投稿通知メール"
        )
    end
end
