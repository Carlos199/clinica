class CreateHorarios < ActiveRecord::Migration[5.0]
  def change
    create_table :horarios do |t|
      t.time :horaIni
      t.time :horaFin
      t.references :dia, foreign_key: true
      t.references :medico, foreign_key: true

      t.timestamps
    end
  end
end
