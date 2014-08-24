# This file is copied to spec/ when you run "rails generate rspec:install"
ENV["RAILS_ENV"] ||= "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "shoulda/matchers"
require "codeclimate-test-reporter"
require "simplecov"
require "coveralls"

travis = ENV["TRAVIS"]
ci = ENV["CI"]
formatters = []
formatters << Coveralls::SimpleCov::Formatter if travis
formatters << SimpleCov::Formatter::HTMLFormatter if !ci
formatters << CodeClimate::TestReporter::Formatter if travis

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]

SimpleCov.start 'rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you"re not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you"re not using ActiveRecord, or you"d prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.reload
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  
  Draper::ViewContext.test_strategy :fast
end