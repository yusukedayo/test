class AddSolvedToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :solved, :boolean, default:false, null:false
  end
end
