json.data do
  json.subscriber do
    json.call(
      @subscriber,
      :id,
      :email,
      :first_name,
      :last_name
    )
  end
  json.token token
end
