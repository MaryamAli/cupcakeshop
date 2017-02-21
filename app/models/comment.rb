class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # Scopes
  scope :rating_desc, -> { order(rating: :desc) }

  # Validations
  validates :body, presence: true
    validates :user, presence: true
    validates :product, presence: true
    validates :rating, numericality: { only_integer: true}

  #for ActiveJob
  after_create_commit { CommentUpdateJob.perform_later(self, @user)}
end
