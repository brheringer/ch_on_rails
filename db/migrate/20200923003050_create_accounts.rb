class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :structure
      t.string :name
      t.references :universe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
