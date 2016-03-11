require_relative 'spec_helper.rb'
require_relative '../lib/user.rb'
require 'minitest/pride'
require 'minitest/autorun'

class TestUser < Minitest::Test
  def setup
    @user = Todo::User.new(first_name: "steve", last_name: "buscemi")
  end

  def test_that_first_name_is_capitalized
    assert_equal "Steve", @user.first_name
  end

  def test_that_last_name_is_capitalized
    assert_equal "Buscemi", @user.last_name
  end

  def test_without_errors
    assert_equal [], @user.validations
  end

  def test_errors
    @user = Todo::User.new
    assert_equal [
      "First name can't be blank.",
      "Last name can't be blank."
    ], @user.validations
  end
end
