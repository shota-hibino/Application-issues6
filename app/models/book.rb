class Book < ApplicationRecord
	belongs_to :user

	has_many :book_comments, dependent: :destroy

	has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	def self.search_for(content, method)
  # 完全一致
    if method == 'perfect'
      Book.where(title: content)
  # 前方一致
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
  # 後方一致
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
  # 部分一致
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
	end
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
