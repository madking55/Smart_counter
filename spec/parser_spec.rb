require 'parser'
require 'pry'

RSpec.describe Parser do
  describe '.parse' do

    context 'if log file exists' do

      it 'returns a hash of webpages with views' do
        
        file = 'spec/sample.log'
        parser = Parser.new
        result = {
                    '/help_page/1' => ['126.318.035.038', '722.247.931.582', '722.247.931.582'],
                    '/contact' => ['184.123.665.067'],
                    '/home' => ['184.123.665.067', '235.313.352.950'],
                    '/about/2' => ['444.701.448.104', '444.701.448.104', '444.701.448.104'],
                    '/about' => ['061.945.150.735']
                  }

        expect(parser.parse(file)).to be_instance_of(Hash)
        expect(parser.parse(file)).to eq(result)
        expect(parser.parse(file).values.flatten.count).to eq(10)
      end
    
      it 'displays empty logs message if file empty' do

        file = 'spec/empty.log'
        parser = Parser.new

        expect(parser.parse(file)).to eq("Log file is empty!")
      end
    end

    context 'if log file does not exist' do
      it 'displays error message' do

        file = 'spec/fake.log'
        parser = Parser.new

        expect(parser.parse(file)).to eq('Log file does not exist!')
      end
    end
  end
end