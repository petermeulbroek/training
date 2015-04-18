json.array!(@selections) do |selection|
  json.extract! selection, :id, :start_x, :start_y, :end_x, :end_y
  json.url selection_url(selection, format: :json)
end
