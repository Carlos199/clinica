class CreateDetalleDias < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_dias do |t|
      t.time :horaini
      t.time :horafin

      t.timestamps
    end
  end
end
