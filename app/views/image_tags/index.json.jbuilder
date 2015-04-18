json.array!(@image_tags) do |image_tag|
  json.extract! image_tag, :id, :image_id, :name, :value
  json.url image_tag_url(image_tag, format: :json)
end
