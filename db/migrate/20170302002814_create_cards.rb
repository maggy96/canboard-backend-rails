class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.belongs_to :list, index: true, null: false
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
