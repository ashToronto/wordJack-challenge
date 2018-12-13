class EmailMetric < ApplicationRecord
  belongs_to :purchase

  def self.yes(purchase)
    EmailMetric.create do |t|
      t.purchase = purchase
      t.choice = true
    end
  end

  def self.no(purchase)
    EmailMetric.create do |t|
      t.purchase = purchase
      t.choice = false
    end
  end

  # A complex sql query to list out email metrics in the admin panel
  def self.index
    sql = <<-SQL
    SELECT
      email_metrics.id,
      email_metrics.choice,
      purchases.id as purchase_id,
      product.name as product,
      users.full_name as user,
      email_metrics.created_at
    FROM email_metrics
    LEFT JOIN purchases on purchases.id = email_metrics.purchase_id
    LEFT JOIN products on products.id = purchases.product_id
    LEFT JOIN users on users.id = purchases.user_id
    ORDER BY email_metrics.id DESC
    LIMIT 100
SQL
    ActiveRecord::Base.connection.select_all(sql)
  end
end #class
