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

    uri = URI('https://seattle.craigslist.org/search/mca?query=450x')
    #response = Net::HTTP.get(uri)
    #@craigslist.setHttpResponse(response)

  end


  def search
    puts 'why are you talking to me????'
  end
end
