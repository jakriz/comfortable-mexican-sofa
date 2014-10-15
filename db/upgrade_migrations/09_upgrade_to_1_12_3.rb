class UpgradeTo1123 < ActiveRecord::Migration
  def self.up
    create_table :comfy_cms_positions do |t|
      t.integer :site_id
      t.integer :positioned_id
      t.string  :positioned_type
      t.integer :position
    end

    add_index :comfy_cms_positions, [:positioned_type, :positioned_id], :unique => true
    add_index :comfy_cms_positions, [:site_id, :positioned_type], :unique => true
  end

  def self.down
    drop_table :comfy_cms_positions
  end
end
