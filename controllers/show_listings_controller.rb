
require 'net/http'
require 'nokogiri'
require 'open-uri'

class ShowListingsController < ApplicationController
  def Show


    parameter = params[:searchTerm]
    puts parameter

    uri = URI('https://seattle.craigslist.org/search/mca?query=' + parameter)
    response = Net::HTTP.get(uri)
    #doc = Nokogiri::HTML(open(Rails.root.join("app/assets/Files/clResult.html")))
    doc = Nokogiri::HTML(response)
    characters = doc.css(".result-row")

    resultsFound = []

    resultsNum = 1
    for resultsrow in characters do
      currentResult = Listing.new
      puts resultsNum

      #imgLink = (resultsrow.css(".result-image"))[0]
      #puts imgLink.text

      titleText = resultsrow.css(".result-title").first.text
      if !(parameter.downcase.in? titleText.downcase)
        next
      end
      currentResult.setPostingTitle(titleText)
      puts 'title text is '
      puts titleText


      postingLink = resultsrow.css("a").first["href"]
      currentResult.setPostingHtmlLink(postingLink)
      puts 'link is'
      puts postingLink

      uri = URI(postingLink)
      response = Net::HTTP.get(uri)
      findPic = Nokogiri::HTML(response)
      picture = findPic.css(".gallery img")
      pictureLink = picture.first["src"]
      puts pictureLink
      currentResult.setPostingImageLink(pictureLink)

      resultsFound.append(currentResult)
      resultsNum += 1
    end

    @allResults = ResultListing.new
    @allResults.setResults(resultsFound)

  end
end
