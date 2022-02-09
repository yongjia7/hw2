# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
People.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

movie1 = Movie.new({ title: "Batman Begins", year_released: 2005, rated: "PG-13", person_id: people1.id })
movie1.save
movie2 = Movie.new({ title: "The Dark Knight", year_released: 2008, rated: "PG-13", person_id: people1.id })
movie2.save
movie3 = Movie.new({ title: "The Dark Knight Rises", year_released: 2012, rated: "PG-13", person_id: people1.id })
movie3.save
people1 = People.new({ name: "Christopher Nolan" })
people1.save
people2 = People.new({ name: "Christian Bale" })
people2.save
people3 = People.new({ name: "Michael Caine" })
people3.save
people4 = People.new({ name: "Liam Neeson" })
people4.save
people5 = People.new({ name: "Katie Holmes" })
people5.save
people6 = People.new({ name: "Gary Oldman" })
people6.save
people7 = People.new({ name: "Heath Ledger" })
people7.save
people8 = People.new({ name: "Aaron Eckhart" })
people8.save
people9 = People.new({ name: "Maggie Gyllenhaal" })
people9.save
people10 = People.new({ name: "Tom Hardy" })
people10.save
people11 = People.new({ name: "Joseph Gordon-Levitt" })
people11.save
people12 = People.new({ name: "Anne Hathaway" })
people12.save
role1 = Role.new({ movie_id: movie1.id, person_id: people2.id, character_name: "Bruce Wayne" })
role1.save
role2 = Role.new({ movie_id: movie1.id, person_id: people3.id, character_name: "Alfred" })
role2.save
role3 = Role.new({ movie_id: movie1.id, person_id: people4.id, character_name: "Ra's Al Ghul" })
role3.save
role4 = Role.new({ movie_id: movie1.id, person_id: people5.id, character_name: "Rachel Dawes" })
role4.save
role5 = Role.new({ movie_id: movie1.id, person_id: people6.id, character_name: "Commissioner Gordon" })
role5.save
role6 = Role.new({ movie_id: movie2.id, person_id: people2.id, character_name: "Bruce Wayne" })
role6.save
role7 = Role.new({ movie_id: movie2.id, person_id: people7.id, character_name: "Joker" })
role7.save
role8 = Role.new({ movie_id: movie2.id, person_id: people8.id, character_name: "Harvey Dent" })
role8.save
role9 = Role.new({ movie_id: movie2.id, person_id: people3.id, character_name: "Alfred" })
role9.save
role10 = Role.new({ movie_id: movie2.id, person_id: people9.id, character_name: "Rachel Dawes" })
role10.save
role11 = Role.new({ movie_id: movie3.id, person_id: people2.id, character_name: "Bruce Wayne" })
role11.save
role12 = Role.new({ movie_id: movie3.id, person_id: people6.id, character_name: "Commissioner Gordon" })
role12.save
role13 = Role.new({ movie_id: movie3.id, person_id: people10.id, character_name: "Bane" })
role13.save
role14 = Role.new({ movie_id: movie3.id, person_id: people11.id, character_name: "John Blake" })
role14.save
role15 = Role.new({ movie_id: movie3.id, person_id: people12.id, character_name: "Selina Kyle" })
role15.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

movies = Movie.all
for movie in movies
    director = People.where({id: movie.person_id}) [0]
    puts "#{movie.title} #{movie.year_released} #{movie.rated} #{director.name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!

roles = Role.all
people_all = People.all
for role in roles
    for movie in movies
        for people in people_all
        puts "#{movie.title} #{people.name} #{role.character_name}" if (role.movie_id == movie.id) & (role.person_id == people.id)
        end
    end
end