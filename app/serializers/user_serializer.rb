class UserSerializer
  def self.user_data(user)
    { "data":
      {
        "type": 'users',
        "id": user.id,
        "attributes":
        {
          "email": user.email,
          "api_key": user.api_key
        }
      } }
  end
end
