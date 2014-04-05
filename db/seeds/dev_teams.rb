t = Team.new(name: 'First')
p1 = Player.where(nick: 'a').first
p2 = Player.where(nick: 'b').first
t.players << p1
t.players << p2

t.save

