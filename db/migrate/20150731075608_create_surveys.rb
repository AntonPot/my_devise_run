class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
