json.extract! comment, :id, :user_id, :posts_id, :text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
