require_relative 'parser'

class Counter
  def initialize(file)
    @webpages_with_views = Parser.new.parse(file)
  end

  def all_views
    all_views = {}
    @webpages_with_views.each { |webpage, views| all_views[webpage] = views.count }
    all_views.sort_by { |key, value| value }.reverse
  end

  def unique_views
    unique_views = {}
    @webpages_with_views.each { |webpage, views| unique_views[webpage] = views.uniq.count }
    unique_views.sort_by { |key, value| value }.reverse
  end
end