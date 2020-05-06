json.data do
  json.subscriber do
    json.call(
      @subscriber,
      :email,
      :first_name,
      :last_name
    )
  end
  json.token token
end
