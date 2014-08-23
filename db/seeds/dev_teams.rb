t = Team.new(name: 'First')
p1 = Player.where(nick: 'a').first
p2 = Player.where(nick: 'b').first
t.members << p1
t.members << p2

t.save

