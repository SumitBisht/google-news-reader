require 'test_helper'
require 'nokogiri'
require 'open-uri'

class NokogiriParserTest < ActionController::TestCase
	url = "http://news.google.com"
	doc = Nokogiri::HTML(open(url))
	content = doc.css('.esc-lead-article-title')
	
	test "Should be able to parse the google news page correctly" do	
		assert_not_nil(content, 'content should be available')
		first_news_piece = content.first
		assert_not_nil(	first_news_piece, 'the first news item should be present')
		assert_not_nil(first_news_piece.content, 'it should have content with itself')
		url = first_news_piece.children[0].attributes["url"].value
		assert_not_nil(url, 'the url should be present')
		assert_equal("http", url[0...4])
	end

	test "Should be able to traverse through available tests" do
		assert_not_nil(content, 'content should be available')
		content.each do |news|
			assert_not_nil(news, 'each news should be present')
			assert_not_nil(news.content, 'there should be content')
			assert_not_nil(news.children[0].attributes["url"].value)
			puts(news.children[0].attributes["url"].value)
		end
	end
end