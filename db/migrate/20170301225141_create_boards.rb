class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.belongs_to :user, index: true, null: false
      t.string :title, null: false
      t.string :description

      t.timestamps
    end
  end
end
