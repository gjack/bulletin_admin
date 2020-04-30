json.data do
  json.user do
    json.call(
      @subscriber,
      :id,
      :email,
      :authentication_token,
    )
  end
end
