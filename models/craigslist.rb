class Craigslist < ApplicationRecord

  @seeds = 10
  @image
  @searchResponse

  def setSeeds(numSeeds)
    @seeds = numSeeds
  end

  def getSeeds
    return @seeds
  end

  def setImage(imgPath)
    @image = imgPath
  end

  def getImage
    return @image
  end

  def setHttpResponse(httpResponse)
    @searchResponse = httpResponse
  end

  def getHttpResponse
    return @searchResponse
  end
end
