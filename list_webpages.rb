require_relative 'lib/reader'
require_relative 'lib/parser'
require_relative 'lib/counter'


file = ARGV[0]

if file.nil? 
  puts 'Please provide a file name!'
else 
  data = Reader.new(file).read_file

  if data.nil?
    puts 'Log file does not exist!'
  elsif data.empty?
    puts "Log file is empty!" 
  else
    logs = Parser.new(data).parse
    webpages = Counter.new(logs)
    puts "Webpages with most views:"
      webpages.all_views.each { |page| puts "#{page[0]} - #{page[1]} views" }
    puts '-------------------------------'
    puts "Webpages with most unique views:"
      webpages.unique_views.each  { |page| puts "#{page[0]} - #{page[1]} unique views"}
  end
end