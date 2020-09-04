class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,     null: false
      t.string     :prefecture,    null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :building_name, null: false
      t.string     :tel_num,       null: false
      t.references :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
