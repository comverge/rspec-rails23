module Rspec
  module Rails23
    if defined?(ActiveRecord)
      module TransactionalDatabaseSupport

        def self.extended(kls)
          kls.send(:include, ActiveRecord::TestFixtures)
          kls.before { setup_fixtures }
          kls.after { teardown_fixtures }
        end
      end

      RSpec.configure do |c|
        c.add_setting :use_transactional_fixtures
        c.add_setting :use_transactional_examples, :alias => :use_transactional_fixtures
        c.add_setting :use_instantiated_fixtures
        c.add_setting :global_fixtures
        c.add_setting :fixture_path
      end
    end
  end
end
