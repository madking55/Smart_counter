class Counter
  def initialize(logs)
    @webpages_with_views = logs
    @all_views = {}
    @unique_views = {}
  end

  def list_all_views
    @webpages_with_views.each { |webpage, views| @all_views[webpage] = views.count }
    sort_views(@all_views)
  end

  def list_unique_views
    @webpages_with_views.each { |webpage, views| @unique_views[webpage] = views.uniq.count }
    sort_views(@unique_views)
  end

  private

  def sort_views(views)
    views.sort_by { |key, value| value }.reverse
  end
end