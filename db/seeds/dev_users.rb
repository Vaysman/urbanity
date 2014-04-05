u1 = User.new(email: 'a@a.com')
u2 = User.new(email: 'b@b.com')

u1.save(validate: false)
u2.save(validate: false)