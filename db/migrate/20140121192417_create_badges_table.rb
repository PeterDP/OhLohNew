class CreateBadgesTable < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :url
      t.string :pips_url
      
      t.timestamps
    end
  end
end
