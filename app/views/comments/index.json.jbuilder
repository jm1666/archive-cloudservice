json.array!(@comments) do |comment|
  json.id comment.id
  json.user_id username(comment.user_id)
  json.content comment.content
  json.created_at comment.created_at
end
