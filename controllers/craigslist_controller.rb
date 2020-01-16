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
    parameter = params[:searchTerm]
    redirect_to action: "Show", controller: "show_listings",  searchTerm: parameter
    return
  end
end
