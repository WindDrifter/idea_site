class User < ActiveRecord::Base
    has_many :ideas, dependent: :nullify
    has_many :comments, dependent: :nullify

    has_many :likes, dependent: :nullify
    has_many :liked_ideas, through: :likes, source: :idea

    has_many :joins, dependent: :nullify
    has_many :joined_ideas, through: :joins, source: :idea

    has_secure_password
    validates :email, uniqueness: true, presence: true, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    def full_name
      "#{firstname} #{lastname}"
    end
    def liked_ideas?(idea)
      liked_ideas.include?(idea)
    end
    def joined_idea?(idea)

    end
end
