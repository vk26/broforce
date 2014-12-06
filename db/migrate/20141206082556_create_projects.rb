class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url
    end

    create_table :users_projects, id: false do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :project, index: true
    end
  end
end
