class AddColumnasToSales < ActiveRecord::Migration[5.0]
  def change
    add_reference :sales, :forma_pago, foreign_key: true
  end
end
