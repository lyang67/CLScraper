
require 'net/http'
require 'nokogiri'
require 'open-uri'

class ShowListingsController < ApplicationController
  def Show


    searchTerm = params[:searchTerm]
    puts searchTerm

    cityString = params[:cities]
    cityArray = cityString.split(",")

    resultsFound = []

    for city in cityArray do
      uri = URI('https://' + city.strip + '.craigslist.org/search/sss?sort=rel&query=' + searchTerm)
      response = Net::HTTP.get(uri)
      #doc = Nokogiri::HTML(open(Rails.root.join("app/assets/Files/clResult.html")))
      doc = Nokogiri::HTML(response)
      characters = doc.css(".result-row")


      resultsNum = 1
      for resultsrow in characters do
        currentResult = Listing.new
        puts resultsNum

        #imgLink = (resultsrow.css(".result-image"))[0]
        #puts imgLink.text

        titleText = resultsrow.css(".result-title").first.text
        if !(searchTerm.downcase.in? titleText.downcase)
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
        #response = Net::HTTP.get(uri)
        #findPic = Nokogiri::HTML(response)
        #picture = findPic.css(".gallery img")
        #pictureLink = picture.first["src"]
        #puts pictureLink
        currentResult.setPostingImageLink("unlockphone.jpg")

        resultsFound.append(currentResult)
        resultsNum += 1
      end

    end

    @allResults = ResultListing.new
    @allResults.setResults(resultsFound)

  end
end
