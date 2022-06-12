class Genre < ApplicationRecord

  has_many :clothes,dependent: :destroy

end
