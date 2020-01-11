class WelcomeController < ApplicationController
  def index
    @index = Index.new

    seedsGiven = 20

    @index.setSeeds(seedsGiven)
    @index.setImage("fullofrage.jpg")
  end
end
