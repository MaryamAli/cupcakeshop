class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # Scopes
  scope :rating_desc, -> { order(rating: :desc) }

end
