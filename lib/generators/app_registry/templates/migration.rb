class CreateAppRegistry < ActiveRecord::Migration
  def self.up
    create_table :app_registries, force: true, id: false do |t|
      t.string  :name, length: 128, null: false
      t.text    :value, null: false
    end

    add_index :app_registries, :name, unique: true
  end

  def self.down
    drop_table :app_registries
  end
end
