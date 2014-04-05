# encoding: UTF-8

[TeamMember, Team, Player, User].each do |model|
  model.delete_all
end
