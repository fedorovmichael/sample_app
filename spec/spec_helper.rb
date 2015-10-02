
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails' 


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|   expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    config.include Capybara::DSL
  end
 
  config.mock_with :rspec do |mocks|    
    mocks.verify_partial_doubles = true
  end
  
  config.include Rails.application.routes.url_helpers
  config.include StaticPagesHelper
  
end
