json.data do
  json.subscriber do
    json.partial! 'v1/subscribers/subscriber', subscriber: subscriber
  end
  json.token token
end
