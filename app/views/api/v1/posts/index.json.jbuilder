json.posts do
  json.array! @posts do |post|
    json.name post.name
    json.content post.content
  end
end
