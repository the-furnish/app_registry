require 'active_record'

module AppRegistry
  class AppRegistry < ::ActiveRecord::Base
    self.primary_key = :name
    validates_presence_of :name, :value
    attr_accessible :name, :value
  end
end
