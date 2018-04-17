class Comment < ActiveRecord::Base
  # I reference an account.：私側は相手先のidを持つ。
  belongs_to :tweet
  belongs_to :user
end
