class DetallepedidosController < InheritedResources::Base

  private

    def detallepedido_params
      params.require(:detallepedido).permit(:solicitado, :pedido_id, :item_id, :observaciones)
    end
end

