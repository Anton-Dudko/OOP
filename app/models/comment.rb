class Comment < ApplicationRecord
  belongs_to :campaign
  validates :body, presence: true
end
