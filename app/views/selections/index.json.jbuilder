json.array!(@selections) do |selection|
  json.extract! selection, :id, :start_x, :start_y, :end_x, :end_y
  json.url image_selection_url(selection.image, selection, format: :json)
end
