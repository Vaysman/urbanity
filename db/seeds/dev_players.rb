u1 = User.where(email: 'a@a.com').first
p = Player.new(user: u1, nick: 'a')
p.save

u1 = User.where(email: 'b@b.com').first
p = Player.new(user: u1, nick: 'b')
p.save
