require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test '#created_by? owner_id と 引数の #id が同じ時' do
    event = FactoryBot.create(:event)
    user = User.new
    user.stub(:id, event.owner_id) do
      assert_equal(true, event.created_by?(user))
    end
  end

  test '#created_by? owner_id と 引数の #id が異なる時' do
    event = FactoryBot.create(:event)
    anothor_user = FactoryBot.create(:user)
    assert_equal(false, event.created_by?(anothor_user))
  end

  test '#created_by? 引数が nil な時' do
    event = FactoryBot.create(:event)
    assert_equal(false, event.created_by?(nil))
  end
end
