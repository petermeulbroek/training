json.array!(@annotations) do |annotation|
  json.extract! annotation, :id, :shapes_id, :src, :text
  json.url annotation_url(annotation, format: :json)
end
