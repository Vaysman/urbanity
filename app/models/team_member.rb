class TeamMember < ActiveRecord::Base
  belongs_to :member, class_name: User, foreign_key: :user_id
  belongs_to :team
end
