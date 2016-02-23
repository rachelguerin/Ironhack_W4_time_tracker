# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# (1..25).each { |i| Project.create name: "Project #{i}", description: "Desc #{i}"}

1.upto(25) do |i| 
	p=Project.create name: "Project #{i}", description: "Desc #{i}"

	1.upto(5) do |j|
		p.entries.create(
			date: Date.today - rand(10).days,
			hours: rand(24), 
			minutes: rand(60)
			)
	end
end