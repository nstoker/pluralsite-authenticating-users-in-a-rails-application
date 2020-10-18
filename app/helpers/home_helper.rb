# frozen_string_literal: true

module HomeHelper
  def articles(_query)
    require 'rss'
    require 'openurl'
    url = 'http://feeds.bbci.co.uk/news/uk/rss.xml'
    open(url) do |rss|
      RSS::Parser.parse(rss)
    end
  end
end
