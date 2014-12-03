module ApplicationHelper
  def secret(key)
    Rails.application.secrets.send(key)
  end
end
