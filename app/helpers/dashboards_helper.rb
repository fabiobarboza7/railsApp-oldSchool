module DashboardsHelper
  def number_to_currency_br(number)
    number_to_currency(number, :unit => "m$ ", :separator => ",", :delimiter => ".")
  end
end
