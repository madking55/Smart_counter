require_relative 'lib/counter'

webpages = Counter.new(ARGV[0])

puts "Webpages with most views:"
  webpages.all_views.each { |page| puts "#{page[0]} - #{page[1]} views" }
puts '-------------------------------'
puts "Webpages with most unique views:"
  webpages.unique_views.each  { |page| puts "#{page[0]} - #{page[1]} unique views"}