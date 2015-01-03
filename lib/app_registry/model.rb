require 'active_record'

module AppRegistry
  class AppRegistry < ::ActiveRecord::Base
    self.primary_key = :name
    validates_presence_of :name, :value

    class << self
      def find_with_default(key, value)
        find(key).value
      rescue ActiveRecord::RecordNotFound
        value
      end

      def atomic_set(key, &block)
        begin
          find_and_update_locked(key, &block)
        rescue ActiveRecord::RecordNotFound
          transaction do
            begin
              create_and_update_locked(key, &block)
            rescue ActiveRecord::RecordNotUnique
              atomic_set(key, &block)
            end
          end
        end
      end

      private

      def find_and_update_locked(key, &block)
        record = lock.find(key)
        yield record
        record.save if record.changed?
      end

      def create_and_update_locked(key, &block)
        record = create({name: key, value: nil})
        yield record
        record.save if record.changed?
      end
    end
  end
end
