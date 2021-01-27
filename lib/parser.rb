class Parser
  # file = ARGV[0]

  def parse(file)
    return 'Log file does not exist!' unless file_provided?(file)
    data = File.readlines(file)
    return "Log file is empty!" if data.empty?
    logs = data.map { |log| log.chomp.split(' ') }
    webpages_with_views = Hash.new { |hash, key| hash[key] = [] }

    logs.each do |log|
      webpage = webpages_with_views[log[0]]
      view = log[1]
      webpage << view
    end
    webpages_with_views
  end

  private

  def file_provided?(file)
    File.exist?(file)
  end
end