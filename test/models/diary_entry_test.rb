require 'test_helper'

class DiaryEntryTest < ActiveSupport::TestCase
  test "should not save without a published_on date" do
    diary_entry = DiaryEntry.new(text: "Example")
    assert_raises(ActiveRecord::NotNullViolation) { diary_entry.save }
  end

  test "should not save without text" do
    date = Date.parse("1660-01-01")
    diary_entry = DiaryEntry.new(published_on: date)
    assert_raises(ActiveRecord::NotNullViolation) { diary_entry.save }
  end

  test "should save correctly" do
    date = Date.parse("1660-01-01")
    diary_entry = DiaryEntry.new(published_on: date, text: "Example")
    assert diary_entry.save
  end
end
