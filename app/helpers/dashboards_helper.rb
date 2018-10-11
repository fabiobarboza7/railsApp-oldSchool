module DashboardsHelper

  def number_to_currency_br(number)
    number_to_currency(number, :unit => "m$ ", :separator => ",", :delimiter => ".")
  end

  def user_range
    user_answers = UserAnswer.where(user: current_user)
    correct = user_answers.where(is_true: true)
    wrong = user_answers.where(is_true: false)

    users = [correct, wrong]
    return users
  end

end
