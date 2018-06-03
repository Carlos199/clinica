class CreateEspecialidades < ActiveRecord::Migration[5.0]
  def change
    create_table :especialidades do |t|
      t.string :codigo
      t.string :descripcion

      t.timestamps
    end
  end
end
