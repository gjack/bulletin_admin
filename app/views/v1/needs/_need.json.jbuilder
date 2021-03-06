json.call(
  need,
  :id,
  :title,
  :description,
  :created_at
)

json.author do
  json.name need.created_by&.full_name
  json.email need.created_by&.email
end

json.organization do
  json.name need.organization.name
  json.id  need.organization.id
end
