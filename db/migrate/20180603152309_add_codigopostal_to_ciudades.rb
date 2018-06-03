class AddCodigopostalToCiudades < ActiveRecord::Migration[5.0]
  def change
    add_column :ciudades, :codigoPostal, :string
  end
end
