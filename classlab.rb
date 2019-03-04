class Student

  attr_accessor :name, :cohort
  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  def talk()
    "I can talk"
  end

  def fav_lang(lang)
    "My fav lang is #{lang}"
  end
end

class SportsTeam
  attr_reader :name_array
  attr_accessor :coach
  def initialize(name_array, coach)
    @name_array = name_array
    @coach = coach
    @points = 0
  end
  def add_name(name)
    @name_array << name
  end

  def check_name?(name)
    @name_array.include?(name)

  end

  def add_points(string)
    @points +=1 if string == "win"
  end

end

class Library
  attr_accessor :books
  def initialize()
    @books = []
  end


  def find_book(title)
    return @books.find{|book| book[:title] == title}
  end

def find_book_rental_details(title)
  result = @books.find{|book| book[:title] == title}
  result[:rental_details]
end

def add_book(new_book)
  @books << new_book
end

def add_book_by_title(title)
  @books << { title: title, rental_details: {
    student_name: "",
    date: ""}}
  return @books
end

def change_rental_details(title, new_hash)
book_to_change = find_book(title)
@books.delete(book_to_change)
@books << new_hash
end



end
