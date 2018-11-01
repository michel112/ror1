class ParallelController < ApplicationController

  # Define the Entry object
  class Entry
    def initialize(title)
      @title = title
      @link = link
    end
    attr_reader :title
    attr_reader :link
  end
  
  def parallelrate
		require 'openssl'
		require 'nokogiri'
		request_url ='https://sfbay.craigslist.org'
		doc = Nokogiri::HTML(open(request_url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
		entries = doc.css('#ccc0 li')
		@entriesArray = []
		entries.each do |entry|
			#url = 'https://'.entries.css('a')['href']
			newUrl = request_url+entry.at_css('a')['href']
				docs = Nokogiri::HTML(open(newUrl, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
					entriy = docs.css('.rows')	
					finalUrl = entriy.css('li').css('a.result-title')[0]['href']
					docs = Nokogiri::HTML(open(finalUrl, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
					@entriesArray << docs.css('#titletextonly').text
		end 
	   render template: 'scrape_reddit'
	end
end


