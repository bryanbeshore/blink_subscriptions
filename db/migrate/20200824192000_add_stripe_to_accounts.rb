class AddStripeToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :stripe_id, :string
    add_column :accounts, :card_brand, :string
    add_column :accounts, :card_last4, :string
    add_column :accounts, :card_exp_month, :string
    add_column :accounts, :card_exp_year, :string
  end
end
