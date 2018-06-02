class CreateDepartamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :departamentos do |t|
      t.string :codigo
      t.string :nombre
      t.references :regione, foreign_key: true

      t.timestamps
    end
  end
end
