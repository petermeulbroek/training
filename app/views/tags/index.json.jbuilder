json.array!(@tags) do |tag|
  json.extract! tag, :id, :type_id, :value
  json.url tag_url(tag, format: :json)
end
