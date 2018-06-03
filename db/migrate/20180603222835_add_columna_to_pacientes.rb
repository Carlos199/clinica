class AddColumnaToPacientes < ActiveRecord::Migration[5.0]
  def change
    add_column :pacientes, :sangre, :string
  end
end
