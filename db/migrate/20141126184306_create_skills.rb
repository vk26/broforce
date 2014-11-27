class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :user, index: true
      t.text :about

      t.timestamps
    end
  end
end
