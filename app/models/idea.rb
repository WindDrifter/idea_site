class Idea < ActiveRecord::Base

  has_many :comments ,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :users, through: :likes
  has_many :joined_users, through: :joins, source: :user
  validates :title, presence: {message: "Must be present"}, uniqueness: true
  belongs_to :user
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/



  def user_name
    if user
      user.firstname
    else
      "guest"
    end
  end
  def like_for(user)
    likes.find_by_user_id(user.id)
  end
  def join_for(user)
    joins.find_by_user_id(user.id)
  end
  def members
    joined_users
  end


end
