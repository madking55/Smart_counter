require 'counter'
require 'parser'
require 'reader'
require 'pry'

RSpec.describe Counter do
  before :all do
    @file = 'spec/sample.log'
    reader = Reader.new(@file)
    data = reader.read_file
    parser = Parser.new(data)
    logs = parser.parse
    @counter = Counter.new(logs)
  end

  describe '.list_all_views' do
    it 'returns list of webpages with most views ordered by most views' do
      result = [["/about/2", 3], ["/help_page/1", 3], ["/home", 2], ["/about", 1], ["/contact", 1]]

      expect(@counter.list_all_views).to eq(result)
      expect(@counter.list_all_views.to_h.values.sum).to eq(File.readlines(@file).count)
    end
  end

  describe '.list_unique_views' do
    it 'returns list of webpages with most unique page views ordered by most views' do
      result = [["/home", 2], ["/help_page/1", 2], ["/about", 1], ["/about/2", 1], ["/contact", 1]]

      expect(@counter.list_unique_views).to eq(result)
    end
  end
end