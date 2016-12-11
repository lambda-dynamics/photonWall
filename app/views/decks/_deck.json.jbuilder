json.extract! deck, :id, :name, :slug, :created_at, :updated_at, :slide_urls
json.url deck_url(deck, format: :json)
