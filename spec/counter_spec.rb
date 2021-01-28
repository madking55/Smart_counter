require 'counter'
require 'pry'

RSpec.describe Counter do
  before :each do
    @file = 'spec/sample.log'
    @counter = Counter.new(@file)
  end

  describe '.all_views' do
    it 'returns lsit of webpages with most views ordered by most views' do
      result = [["/about/2", 3], ["/help_page/1", 3], ["/home", 2], ["/about", 1], ["/contact", 1]]

      expect(@counter.all_views).to eq(result)
      expect(@counter.all_views.to_h.values.sum).to eq(File.readlines(@file).count)
    end
  end

  describe '.unique_views' do
    it 'returns list of webpages with most unique page views ordered by most views' do
      result = [["/home", 2], ["/help_page/1", 2], ["/about", 1], ["/about/2", 1], ["/contact", 1]]

      expect(@counter.unique_views).to eq(result)
    end
  end
end