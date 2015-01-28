require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  begin
    test 'should dasdasdas' do
      user = User.new
      user.username = 'Testuser'
      user.password = '123456'
      user.email = '1@me.com'

      # kollar att det verkligen är true (assert)
      assert_equal('Testuser is called 123456',user.info,'dom är samma')
    end
  end

  #write test to make sure api destroy if user gone


  test 'should save with username' do
    user = User.new
    user.username = 'Testuser'
    user.password = '123456'
    user.email = '1@me.com'


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
    user.email = '1@me.com'


    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

  test 'should not save user with to long username' do
    user = User.new
    user.username = 'bosseharförlångtusernameochkanejsparasidatabas'
    user.password = '123456'
    user.email = '1@me.com'

    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

  test 'should  save user with username between 6-30 chars and correct password' do
    user = User.new
    user.username = 'bosse1'
    user.password = '123456'
    user.email = '1@me.com'


    # kollar att det verkligen är false (assert_not)
    assert user.save
  end

  #tests for password attribute

  test 'should not save user with to short password' do
    user = User.new
    user.username = 'bosse1'
    user.password = '12345'
    user.email = '1@me.com'


    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

  #tests for email attribute
  test 'should not save user with to short email' do
    user = User.new
    user.username = 'bosse1'
    user.password = '123456'
    user.email = '1@m'

    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

  test 'should not save user with corrupt email' do
    user = User.new
    user.username = 'bosse1'
    user.password = '123456'
    user.email = '1@dsadasdsam'

    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

end
