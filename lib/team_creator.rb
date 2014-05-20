class TeamCreator
  def initialize(player)
    @player = player
  end

  def cannot_create_team_reason
    "alrady in team"
  end

  def can_create_team?
    true
  end
end
