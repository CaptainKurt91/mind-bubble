p "Writing seed file!"

will = User.new(email: "will@dunwoody.com", password: "123456")
home = Home.new
home.user = will

todo = Category.new(title: "ToDo")
todo.home = home
todo.save

today = Category.new(title: "today")
today.home = home
today.save

work = Category.new(title: "work")
work.home = home
work.save

custom = Category.new(title: "custom")
custom.home = home
custom.save

notes = Category.new(title: "notes")
notes.home = home
notes.save

personal = Category.new(title: "personal")
personal.home = home
personal.save

p "Seeds done"
