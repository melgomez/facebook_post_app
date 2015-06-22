json.array!(@posts) do |post|
  json.extract! post, :id, :status, :published, :publish_date
  json.url post_url(post, format: :json)
end
