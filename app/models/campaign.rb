class Campaign < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :tidings, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :rewards, dependent: :destroy

  belongs_to :user
  belongs_to :category

  validates :title, :summary, :body, :aim, :current, presence: true
  validates :donate, :numericality => { :greater_than_or_equal_to => 0 }

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
