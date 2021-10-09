class Post < ApplicationRecord
  has_many_attached :images

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
