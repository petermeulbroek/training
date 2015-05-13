json.annotations @annotations do |annotation|
  json.extract! annotation, :id, :src, :text
  json.shapes annotation.shapes do |shape|
    json.type "rect"
    json.geometry do
      json.extract! shape, :x, :y, :width, :height
    end
  end
  json.url annotation_url(annotation, format: :json)
end
