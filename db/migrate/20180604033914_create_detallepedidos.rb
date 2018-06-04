class CreateDetallepedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :detallepedidos do |t|
      t.integer :solicitado
      t.integer :surtido
      t.references :pedido, foreign_key: true
      t.references :item, foreign_key: true
      t.string :observaciones

      t.timestamps
    end
  end
end
