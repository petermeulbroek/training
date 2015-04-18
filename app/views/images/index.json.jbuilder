json.array!(@images) do |image|
  json.extract! image, :id, :url, :validated
  json.url image_url(image, format: :json)
end
