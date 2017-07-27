class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { medium: "640x", small: "340x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  has_many :comments, dependent: :destroy
end
