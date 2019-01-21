require 'test_helper'

class DiaryEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diary_entries_url
    assert_response :success
  end

  test "should get show" do
    diary_entry = DiaryEntry.first
    get diary_entry_url(diary_entry.id)
    assert_response :success
  end

end
