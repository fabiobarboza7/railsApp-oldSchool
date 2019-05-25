class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :sale
 
  # before_save :change

  # def change
  # 	self.
  # end
end
