class PurchasesController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @purchase = Purchase.create(create_params) do |t|
      t.product = @product
      t.user = current_user
    end

    if @purchase.errors.any?
      render :new
    else
      UserMailer.after_purchase(@purchase.id).deliver
    end
  end

  protected
  def create_params
      params.fetch(:purchase, {}).
        permit(:quantity)
  end
end # class
