json.id @post.id
json.title @post.title
json.content @post.content
json.picture @post.picture.url
json.user username(@post.user_id)
json.category_id @post.category_id
json.comments post_comments_url(@post, format: :json)
