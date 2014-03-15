json.(@feed, :id, :title, :url)

@entries ||= nil
unless @entries.nil?
  json.entries(@entries) do |entry|
    json.(entry, :id, :title, :link, :feed_id)
  end
end
