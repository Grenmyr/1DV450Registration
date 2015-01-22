require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should save with username' do
    user = User.new
    user.username = 'Testuser'
    user.password = '123456'

    # kollar att det verkligen är true (assert)
    assert user.save
  end

  test 'should not save without username' do
    user = User.new


    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

  # tests for usename attribute
  test 'should not save user with to short username' do
    user = User.new
    user.username = 'bosse'
    user.password = '123456'


    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

  test 'should not save user with to long username' do
    user = User.new
    user.username = 'bosseharförlångtusernameochkanejsparasidatabas'
    user.password = '123456'


    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

  test 'should  save user with username between 6-30 chars and correct password' do
    user = User.new
    user.username = 'bosse1'
    user.password = '123456'


    # kollar att det verkligen är false (assert_not)
    assert user.save
  end

  #tests for password attribute

  test 'should not save user with to short password' do
    user = User.new
    user.username = 'bosse1'
    user.password = '12345'


    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end



end
