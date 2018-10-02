module TransitionsHelper
  def user_target(id)
    User.find(id)
  end
end
