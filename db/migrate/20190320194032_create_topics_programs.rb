class CreateTopicsPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :topics_programs do |t|
      t.integer :program_id
      t.integer :topic_id
    end
  end
end
