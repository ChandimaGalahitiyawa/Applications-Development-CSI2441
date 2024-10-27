json.extract! quote, :id, :user_id, :philosopher_id, :text, :publication_year, :comment, :created_at, :updated_at
json.categories quote.categories.map(&:name)
json.url quote_url(quote, format: :json)
