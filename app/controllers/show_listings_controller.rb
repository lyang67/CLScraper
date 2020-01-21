
require 'net/http'
require 'nokogiri'
require 'open-uri'

class ShowListingsController < ApplicationController
  def Show


    searchTerm = params[:searchTerm]
    #fj%20cruiser
    searchTermArray = searchTerm.split(" ")
    if searchTermArray.count > 1
      searchTermReady = ''
      for term in searchTermArray do
        searchTermReady += term + '%20'
      end
    else
      searchTermReady = searchTerm
    end
    puts searchTermReady

    cityString = params[:cities]
    cityArray = cityString.split(",")

    resultsFound = []

    for city in cityArray do
      uri = URI('https://' + city.strip + '.craigslist.org/search/sss?sort=rel&query=' + searchTermReady)
      puts uri
      begin
        response = Net::HTTP.get_response(uri)
      rescue
        next
      end
      if (response.blank? || response.code != '200')
        puts 'got no response or invalid response'
        next
      end
      #doc = Nokogiri::HTML(open(Rails.root.join("app/assets/Files/clResult.html")))
      doc = Nokogiri::HTML(response.body)
      characters = doc.css(".result-row")


      resultsNum = 1
      for resultsrow in characters do
        currentResult = Listing.new
        puts resultsNum

        titleText = resultsrow.css(".result-title").first.text
        if (titleText.blank?)
          currentResult.setPostingTitle('Cannot get posting title')
        else
          currentResult.setPostingTitle(titleText)
        end

        if !(searchTerm.downcase.in? titleText.downcase)
          next
        end

        # set the post link
        postingLink = resultsrow.css("a").first["href"]
        if (postingLink.blank?)
          currentResult.setPostingHtmlLink("http://seattle.craigslist.org")
        else
          currentResult.setPostingHtmlLink(postingLink)
        end

        # get the image url from the data-ids attribute
        postingImg = resultsrow.css(".result-image").first["data-ids"]

        if (postingImg.blank?)
          next
        end

        imgIds = postingImg.split("1:")
        imgId = imgIds[1]

        if (imgId[imgId.length - 1] == ',')
          imgId = imgId[0...-1]
        end
        puts 'img link id is'
        puts imgId
        imgUrl = 'https://images.craigslist.org/' + imgId + '_300x300.jpg'
        currentResult.setPostingImageLink(imgUrl)

        resultsFound.append(currentResult)
        resultsNum += 1
      end

    end

    @allResults = ResultListing.new
    @allResults.setResults(resultsFound)

  end
end
