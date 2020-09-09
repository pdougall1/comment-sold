class InventoriesController < ApplicationController
  def index
    
    @total_count = Inventory.sum(:quantity)

    # TODO: paginate
    inventories = Inventory.includes(:product)

    if params[:sku].present?
      @sku = params[:sku]
      inventories = inventories.where(sku: @sku)
    end

    if params[:product_id].present?
      @product_id = params[:product_id]
      inventories = inventories.where(product_id: @product_id)
    end

    @inventory = inventories.all
  end
end
