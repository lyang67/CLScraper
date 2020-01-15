
require 'net/http'
require 'nokogiri'
require 'open-uri'

class ShowListingsController < ApplicationController
  def Show
    doc = Nokogiri::HTML(open(Rails.root.join("app/assets/Files/clResult.html")))
    characters = doc.css(".result-row")

    resultsFound = []

    resultsNum = 1
    for resultsrow in characters do
      currentResult = Listing.new
      puts resultsNum

      #imgLink = (resultsrow.css(".result-image"))[0]
      #puts imgLink.text

      titleText = resultsrow.css(".result-title").first.text
      currentResult.setPostingTitle(titleText)
      puts 'title text is '
      puts titleText


      postingLink = resultsrow.css("a").first["href"]
      currentResult.setPostingHtmlLink(postingLink)
      puts 'link is'
      puts postingLink

      resultsFound.append(currentResult)
      resultsNum += 1
    end

    @allResults = ResultListing.new
    @allResults.setResults(resultsFound)

  end
end
