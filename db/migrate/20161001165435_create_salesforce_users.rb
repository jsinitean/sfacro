class CreateSalesforceUsers < ActiveRecord::Migration
  def change
    create_table :salesforce_users do |t|

      t.timestamps null: false
    end
  end
end
