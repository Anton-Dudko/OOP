class Tiding < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :campaign
  validates :title, :body, presence: true
end
