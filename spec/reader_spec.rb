require 'reader'
require 'pry'

RSpec.describe Reader do
  describe '.read_file' do
    context 'provided file exists' do
      it 'returns array of data if file not empty' do
        file = 'spec/sample.log'
        reader = Reader.new(file)
        result = ["/help_page/1 126.318.035.038\n",
                  "/help_page/1 722.247.931.582\n",
                  "/help_page/1 722.247.931.582\n",
                  "/contact 184.123.665.067\n",
                  "/home 184.123.665.067\n",
                  "/home 235.313.352.950\n",
                  "/about/2 444.701.448.104\n",
                  "/about/2 444.701.448.104\n",
                  "/about/2 444.701.448.104\n",
                  "/about 061.945.150.735"]

        expect(reader.read_file).to be_instance_of(Array)
        expect(reader.read_file).to eq(result)
      end

      it 'returns [] if file empty' do
        file = 'spec/empty.log'
        reader = Reader.new(file)

        expect(reader.read_file).to eq([])
      end
    end

    context 'provided file does not exist' do
      it 'returns nil' do
        file = 'spec/fake.rb'
        reader = Reader.new(file)

        expect(reader.read_file).to be(nil)
      end
    end
  end
end