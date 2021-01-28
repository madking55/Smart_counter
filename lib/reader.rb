class Reader

  def initialize(file)
    @file = file
    @data = nil 
  end

  def read_file
    @data = File.readlines(@file) if File.exist?(@file)
  end
end
