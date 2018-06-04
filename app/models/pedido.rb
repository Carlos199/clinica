class Pedido < ApplicationRecord
  belongs_to :proveedore
  belongs_to :user
  has_many :sales

  has_many :detallepedidos, dependent: :destroy
  has_many :items, through: :detallepedidos
  


  validates :proveedore_id, presence: { message: "Debe seleccionar un Titular" }

  accepts_nested_attributes_for :detallepedidos, :reject_if => lambda { |c| c[:item_id].blank?}

  private
    def self.generar_folio
      time, numero_random = Time.new, Random.new
      orden = time.strftime("%Y%m%d") + "#{numero_random.rand(100)}"
      if Pedido.exists?(codigo: orden)
        generar_folio
      else
        orden
      end
    end

    def self.recientes
      Pedido.order("created_at DESC").limit(9)
    end
end
