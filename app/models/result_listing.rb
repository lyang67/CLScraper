class ResultListing
  @searchResult
  @numResults

  def setResults(results)
    @searchResult = results
  end

  def getResults
    return @searchResult
  end

  def setNumResults(numResults)
    @numResults = numResults
  end

  def getNumResults
    return @numResults
  end
end