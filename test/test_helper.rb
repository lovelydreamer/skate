ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

# For Permutation testing
require "base64"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Find permutations of data
  def permutations_of(input)
    permutations = [input]
    permutations << Base64.encode64(input)
    permutations << URI.encode(input)
    permutations << URI.decode(input)
    permutations << input.upcase
    permutations << input.downcase
  end

  def assert_no_permutation(needle, haystack)
    permutations_of(needle).each do |p|
      assert_no_match(Regexp.new(p), haystack)
    end
  end
end

# TODO: Write test for audit logging, which tests the helper methods