class Index
  @seeds = 10
  @image

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
end