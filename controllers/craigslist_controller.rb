require 'net/http'
require 'nokogiri'
require 'open-uri'

class CraigslistController < ApplicationController
  def craigslist

    @craigslist = Craigslist.new
    @craigslist.numSeeds = 0
    seedsGiven = 20

    @craigslist.setSeeds(seedsGiven)
    @craigslist.setImage("fullofrage.jpg")


    #@craigslist.setHttpResponse(response)

  end


  def search
    searchTerms = params[:searchTerm]
    citiesToSearch = params[:cities]
    redirect_to action: "Show", controller: "show_listings",  searchTerm: searchTerms, cities: citiesToSearch
    return
  end
end
