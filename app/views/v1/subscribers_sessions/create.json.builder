json.data do
  json.subscriber do
    json.call(
      @subscriber,
      :email
    )
  end
  json.token token
end
