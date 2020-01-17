class Listing
  @PostingTitle
  @PostingHtmlLink
  @PostingImageLink

  def setPostingTitle(title)
    @PostingTitle = title
  end

  def getPostingTitle
    return @PostingTitle
  end

  def setPostingHtmlLink(link)
    @PostingHtmlLink = link
  end

  def getPostingHtmlLink
    return @PostingHtmlLink
  end

  def setPostingImageLink(imgLink)
    @PostingImageLink = imgLink
  end

  def getPostingImage
    return @PostingImageLink
  end
end