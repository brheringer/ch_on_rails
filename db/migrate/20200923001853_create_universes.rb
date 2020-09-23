class CreateUniverses < ActiveRecord::Migration[6.0]
  def change
    create_table :universes do |t|
      t.string :name

      t.timestamps
    end
  end
end
