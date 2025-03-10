class CreateHeros < ActiveRecord::Migration[7.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.text :description
      t.string :power
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
