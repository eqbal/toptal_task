  json.entries @entries, partial: 'api/v1/entries/show', as: :entry
  json.total_count @entries.to_a.count
  