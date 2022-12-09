p "Writing seed file!"

will = User.new(email: "will@dunwoody.com", password: "123456")
home = Home.new
home.user = will

todo = Category.new(name:"ToDo")
todo.home = home
todo.save

today = Category.new(name:"today")
today.home = home
today.save

work = Category.new(name:"work")
work.home = home
work.save

custom = Category.new(name:"custom")
custom.home = home
custom.save

notes = Category.new(name:"notes")
notes.home = home
notes.save

personal = Category.new(name:"personal")
personal.home = home
personal.save

p "Seeds done"
