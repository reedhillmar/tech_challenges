require 'open-uri'

def parse_url(url)
  content = URI.open(url).read

  require 'pry';binding.pry
end

parse_url("https://docs.google.com/document/d/e/2PACX-1vRMx5YQlZNa3ra8dYYxmv-QIQ3YJe8tbI3kqcuC7lQiZm-CSEznKfN_HYNSpoXcZIV3Y_O3YoUB1ecq/pub")