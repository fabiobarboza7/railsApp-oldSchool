class Sale < ApplicationRecord
	has_many :exchanges, dependent: :destroy
end
