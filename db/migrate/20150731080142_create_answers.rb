class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.string :long_answer
      t.boolean :short_answer

      t.timestamps null: false
    end
  end
end
