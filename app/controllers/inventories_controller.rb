class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_count = Inventory.sum(:quantity)

    inventories = Inventory.includes(:product).page(params[:page]).per(100)

    if params[:sku].present?
      @sku = params[:sku]
      inventories = inventories.where(sku: @sku)
    end

    if params[:product_id].present?
      @product_id = params[:product_id]
      inventories = inventories.where(product_id: @product_id)
    end

    if params[:threshold].present?
      @threshold = params[:threshold]
      inventories = inventories.where('quantity > ?', @threshold)
    end

    @inventory = inventories.all
  end
end
