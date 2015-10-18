After do |scenario|
  Mongoid.default_client.database.collections.each do |collection|
    unless collection.name.match(/^system\./)
      collection.drop
    end
  end
end