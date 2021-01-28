#  Solution draft

# Read data from provided file (receives a log as argument e.g.: ./parser.rb webserver.log)
  file = ARGV[0]
  data = File.readlines(file)

# TODO file with data not found
# TODO file exists but is empty

# Parse data into hash where webpage is the key and has a value of an array with all IP adressess that this webpage was viewed from

  # data.first => "/help_page/1 126.318.035.038\n"

  logs = data.map { |log| log.chomp.split(' ') }

  # logs.first => ["/help_page/1", "126.318.035.038"]

  webpages_with_views = Hash.new { |hash, key| hash[key] = [] }

  logs.each do |log|
    webpage = webpages_with_views[log[0]]
    view = log[1]
    webpage << view
  end

  # p webpages_with_views.first

# List of webpages with most page views ordered from most pages views to less page views
  all_views = {}
  webpages_with_views.each { |webpage, views| all_views[webpage] = views.count }
  p all_views.sort_by { |key, value| value }.reverse.to_h 
  p data.count == all_views.values.sum

# List of webpages with most unique page views also ordered
  unique_views = {}
  webpages_with_views.each { |webpage, views| unique_views[webpage] = views.uniq.count }
  p unique_views.sort_by { |key, value| value }.reverse.to_h 
