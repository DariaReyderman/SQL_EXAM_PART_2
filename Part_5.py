import sqlite3

conn = sqlite3.connect('exam.db')
conn.row_factory = sqlite3.Row
cursor = conn.cursor()

print("-" * 10, "Alef", "-" * 10)
cursor.execute("SELECT * FROM movies")
rows = cursor.fetchall()
result = [dict(row) for row in rows]
print(result)

print("-" * 10, "Bet", "-" * 10)
searching: str = input("Enter the name of the film you would like to watch: ")

cursor.execute("""
    SELECT movie_name
    FROM movies
    WHERE movie_name LIKE ? COLLATE NOCASE
""", ("%" + searching + "%",))

films = cursor.fetchall()

if films:
    searching_result = [dict(film) for film in films]
    print(searching_result)
else:
    print("Your request didn't return any results.")

print("-" * 10, "Gimel", "-" * 10)

movie_name: str = input("Enter the name of the movie: ")
genre: str = input("Enter the genre: ")
country: str = input("Enter the country of production: ")
language: str = input("Enter the language of the movie: ")
year: int = int(input("Enter the release year of the movie (not earlier 2009): "))
revenue: float = float(input("Enter the amount of revenue (in millions): "))

try:
    cursor.execute("""
        INSERT INTO movies (movie_name, genre, country, language, year, revenue)
        VALUES (?, ?, ?, ?, ?, ?);
    """, (movie_name, genre, country, language, year, revenue))
    conn.commit()
    print(f"The movie {movie_name} was successfully added to the movies' list")
except sqlite3.IntegrityError:
    print(f"Oooops: The movie {movie_name} already exists")

conn.close()
