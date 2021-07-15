
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

College.destroy_all
Team.destroy_all
Player.destroy_all
Fixture.destroy_all
FixtureTeam.destroy_all
# Match.destroy_all
# User.destroy_all

# create colleges 
colleges = ["Benjamin Franklin", "Berkeley", "Branford", "Davenport", "Ezra Stiles", "Grace Hopper", "Jonathan Edwards", "Morse", "Pauli Murray", "Pierson", "Saybrook", "Silliman", "Timothy Dwight", "Trumbull"]

colleges.each do |c|
    college = College.new(name: c)
    college.save
end

# create teams
College.all.each do |c|
    team = Team.new
    team.college = c
    team.description = Faker::Lorem.paragraph

    team.save
end

# create players. Every team should have 5 players

def create_player(team, classes)
    player = Player.new
    player.first_name = Faker::Name.first_name 
    player.last_name = Faker::Name.last_name 
    player.team = team
    player.class_of = classes.sample
    
    player.save
end

current_year = Time.new.year
classes = (current_year..current_year+4).to_a

Team.all.each do |t|
    5.times do 
        create_player(t, classes)
    end
end 

# create upcoming fixtures

20.times do
    # create a new fixture
    f = Fixture.new
    f.date_time = (Time.now+rand(30))
    f.date_time = f.format_date_time.to_datetime
    f.completed = 0
    f.save

    # create two fixture_teams
    
    # pick two random teams for this fixture
    teams = Team.all.sample(2)
    
    teams.each do |t|
        ft = FixtureTeam.new
        ft.fixture = f
        ft.team = t
        ft.save
    end
end

# create past fixtures
10.times do
    # create a new fixture
    f = Fixture.new
    f.date_time = (Time.now-rand(90))
    f.date_time = f.format_date_time.to_datetime
    f.completed = 1
    f.save

    # create two fixture_teams
    
    # pick two random teams for this fixture
    teams = Team.all.sample(2)
    
    teams.each do |t|
        ft = FixtureTeam.new
        ft.fixture = f
        ft.team = t
        ft.save
    end
end

# create matches
def create_matches(fixture, num_of_matches)
    c=0
    num_of_matches.times do
        match = Match.new
        match.fixture = fixture
        match.name = "Match #{c} Between #{fixture.teams[0].name} and #{fixture.teams[1].name}"
        match.save
        c += 1
    end
end

# 3 matches per fixture
Fixture.all.each do |f|
    c = 0
    num_of_matches = 3 # best of 3!
    create_matches(f, num_of_matches)
end




