class AddPostCodeTariffOperationalToSpaces < ActiveRecord::Migration[6.0]
  def change
    add_column :spaces, :post_code, :string
    add_column :spaces, :tariff, :string
    add_column :spaces, :operational_hours, :string
  end
end
