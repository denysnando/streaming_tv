# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.start
    # TODO: Bring back FactoryBot lint when we're done with the models migration
    # FactoryBot.lint
  ensure
    DatabaseCleaner.clean
  end
end
