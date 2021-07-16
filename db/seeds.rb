
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
Match.destroy_all
MatchPlayer.destroy_all
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
    team.college = c # for now
    team.name = c.name
    team.description = Faker::Lorem.paragraph

    team.save
end

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

# create players. Every team should have 5 players
Team.all.each do |t|
    5.times do 
        create_player(t, classes)
    end
end 

def create_fixture_teams(n, fixture)
    # pick n random teams for this fixture
    teams = Team.all.sample(n)
    
    teams.each do |t|
        ft = FixtureTeam.new
        ft.fixture = fixture
        ft.team = t
        ft.save

    end
end

# create past fixtures
40.times do
    # create a new fixture
    f = Fixture.new
    f.date_time = (Time.now-rand(11000000))
    f.date_time = f.format_date_time.to_datetime
    f.completed = 1

    # create two fixture_teams
    num_fixture_teams = 2
    create_fixture_teams(num_fixture_teams, f)
    
    # Fixture name for index of fixtures. Format: "Team 1 vs Team 2"
    f.name = "#{f.teams[0].name} vs #{f.teams[1].name}"

    # declare the winer of a fixture
    # get the teams

    # compare the scores
    # pick the team with the highest score

    f.save

end

# create upcoming fixtures
30.times do
    # create a new fixture
    f = Fixture.new
    f.date_time = (Time.now+rand(11000000))
    f.date_time = f.format_date_time.to_datetime
    f.completed = 0

    # create two fixture_teams
    num_fixture_teams = 2
    create_fixture_teams(num_fixture_teams, f)

    # Fixture name for index of fixtures. Format: "Team 1 vs Team 2"
    f.name = "#{f.teams[0].name} vs #{f.teams[1].name}"
    f.save
end

def create_match_players(match)
    
    teams = match.fixture.teams
    

    teams.each do |t|
        winner = 1
        #byebug
        match_player = MatchPlayer.new
        match_player.match = match
        match_player.player = t.players.sample
        match_player.winner = winner
        match_player.save

        #byebug
        #switch value of winner for next player
        if winner
            # update score
            fts = FixtureTeam.select{|ft| ft.fixture_id == match.fixture_id}

            ft = fts.find{|ft| ft.team == t}
            #byebug
            ft.score = ft.score ? ft.score + 1 : 1
            #byebug
            ft.save
            #byebug
            if rand(0...100000) % 2 ==0
                winner = 0
            else
                winner = 1
            end
        end  
    end
end

# create matches
def create_matches(fixture, num_of_matches)
    c=0
    
    num_of_matches.times do
        match = Match.new
        match.fixture = fixture
        match.name = "Match #{c} between #{fixture.teams[0].name} and #{fixture.teams[1].name}"
        match.save

        # make two players from each teams for the matches
        create_match_players(match)
        c += 1
    end
end

# 3 matches per fixture
Fixture.all.first(40).each do |f|
    c = 0
    num_of_matches = 3 # best of 3!
    create_matches(f, num_of_matches)
end






