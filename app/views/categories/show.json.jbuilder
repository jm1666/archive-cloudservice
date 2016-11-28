json.array!(Post.where(category_id: @category.id).each) do |post|
  json.extract! post, :id, :title
  json.url post_url(post, format: :json)
end
