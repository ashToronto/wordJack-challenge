class EmailMetricsController < ApplicationController
  before_action :find_purchase

  def yes
    EmailMetric.yes(@purchase)
  end

  def no
    EmailMetric.no(@purchase)
  end

  protected
  def find_purchase
    @purchase = Purchase.find(params[:id])
  end
end
