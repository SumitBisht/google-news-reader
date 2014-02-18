require 'nokogiri'
require 'open-uri'
class NewsReaderController < ApplicationController
  def news
  	@articles = []
    url = "http://news.google.com"
    doc = Nokogiri::HTML(open(url))
    content = doc.css('.esc-lead-article-title')
    content.each do |news|
      text = news.content
      url = news.children[0].attributes["url"].value
      @articles.push News.find_or_create_by(title:text, url:url)
    end
  end
end
