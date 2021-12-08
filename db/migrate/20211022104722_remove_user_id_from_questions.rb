class RemoveUserIdFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :user_id, :string
  end
end



rails g model User nickname:string email:string password_digest:string admin:boolean