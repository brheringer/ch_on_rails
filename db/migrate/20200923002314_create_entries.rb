class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.date :date
      t.numeric :value
      t.text :memo
      t.references :account, null: false, foreign_key: true
      t.references :cost_center, null: false, foreign_key: true
      t.references :universe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
