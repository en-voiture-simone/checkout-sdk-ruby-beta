class SdkCredentials

  def get_authorization(authorization_type)
    raise NotImplementedError, "Implement this method in a child class"
  end

end
