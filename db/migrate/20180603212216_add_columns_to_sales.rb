class AddColumnsToSales < ActiveRecord::Migration[5.0]
  def change
    add_reference :sales, :paciente, foreign_key: true
  end
end
