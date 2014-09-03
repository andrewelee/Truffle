json.array!(@brands) do |brand|
  json.partial!("brand", brand: brand)
end