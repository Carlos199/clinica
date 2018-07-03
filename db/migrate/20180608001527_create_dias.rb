class CreateDias < ActiveRecord::Migration[5.0]
  def change
    create_table :dias do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
