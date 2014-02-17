require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  test "News model should be able to save the News name and its url" do
  	sample_title = 'India loses the series'
  	url = 'http://espn.cricinfo.com/match-results/01032456'
    sample = News.create(:title=>sample_title, :url=>url)
    assert_equal(sample.title, sample_title)
    assert_equal(sample.url, url)
  end
  test "for an empty model, things should be, well empty" do
  	empty = News.create()
  	assert_nil(empty.title)
  	assert_nil(empty.url)
  end
end
