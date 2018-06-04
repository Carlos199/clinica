class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :codigo
      t.string :nombre
      t.string :ruc
      t.string :siglas
      t.references :ciudade, foreign_key: true
      t.string :direccion
      t.string :telefono1
      t.string :telefono2
      t.string :correo
      t.string :pagina
      t.string :image

      t.timestamps
    end
  end
end
