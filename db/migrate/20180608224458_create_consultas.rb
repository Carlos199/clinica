class CreateConsultas < ActiveRecord::Migration[5.0]
  def change
    create_table :consultas do |t|
      t.datetime :data
      t.float :preco
      t.string :nome_plano
      t.string :tipo_plano
      t.string :tipo_consula
      t.references :medico, foreign_key: true
      t.references :paciente, foreign_key: true

      t.timestamps
    end
  end
end
