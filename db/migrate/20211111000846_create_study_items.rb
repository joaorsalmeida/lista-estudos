class CreateStudyItems < ActiveRecord::Migration[6.1]
  def change
    create_table :study_items do |t|
      t.string :title
      t.string :description
      t.boolean :done

      t.timestamps
    end
  end
end
