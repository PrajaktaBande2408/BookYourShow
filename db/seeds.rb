# Create Movies
movies = Movie.create([
  { title: "Kal ho na ho", genre: "Drama" },
  { title: "Jawan", genre: "Thriller" },
  { title: "DDLJ", genre: "Drama" }
])

# Create Showtimes
showtimes = Showtime.create([
  { movie: movies[0], start_time: Time.now + 2.days, end_time: Time.now + 2.days+ 3.hours, available_seats: 100 },
  { movie: movies[1], start_time: Time.now + 3.days, end_time: Time.now + 3.days+ 3.hours, available_seats: 80 },
  { movie: movies[2], start_time: Time.now + 4.days, end_time: Time.now + 4.days+ 3.hours, available_seats: 120 }
])

