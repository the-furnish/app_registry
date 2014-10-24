require 'rails/generators/migration'
require 'rails/generators/active_record'

class AppRegistryGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  self.source_paths << File.join(File.dirname(__FILE__), 'templates')

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_app_registry.rb'
  end

  def self.next_migration_number dirname
    ActiveRecord::Generators::Base.next_migration_number dirname
  end
end
