class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :body, presence: {message: ":Answer is required"}, uniqueness: {scope: :idea_id} #answer body unique per question
  belongs_to :user

  def user_name
    if user
      user.full_name
    else
      "Someone"
    end

  end

end
