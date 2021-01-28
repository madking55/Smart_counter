require 'parser'
require 'reader'
require 'pry'

RSpec.describe Parser do
  describe '.parse' do
    it 'returns a hash of webpages with views' do
      
      file = 'spec/sample.log'
      reader = Reader.new(file)
      data = reader.read_file
      parser = Parser.new(data)
      result = {
                  '/help_page/1' => ['126.318.035.038', '722.247.931.582', '722.247.931.582'],
                  '/contact' => ['184.123.665.067'],
                  '/home' => ['184.123.665.067', '235.313.352.950'],
                  '/about/2' => ['444.701.448.104', '444.701.448.104', '444.701.448.104'],
                  '/about' => ['061.945.150.735']
                }

      expect(parser.parse).to be_instance_of(Hash)
      expect(parser.parse).to eq(result)
      expect(parser.parse.values.flatten.count).to eq(10)
    end
  end
end
