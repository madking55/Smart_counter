class Parser

  def initialize(data)
    @data = data
  end

  def parse
    logs = @data.map { |log| log.chomp.split(' ') }
    parsed_logs = Hash.new { |hash, key| hash[key] = [] }

    logs.each do |log|
      webpage = parsed_logs[log[0]]
      view = log[1]
      webpage << view
    end
    
    parsed_logs
  end
end
