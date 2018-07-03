class CreateReservas < ActiveRecord::Migration[5.0]
  def change
    create_table :reservas do |t|
      t.date :fecha
      t.time :hora
      t.string :observaciones
      t.references :paciente, foreign_key: true
      t.references :medico, foreign_key: true
      t.references :estado, foreign_key: true

      t.timestamps
    end
  end
end
