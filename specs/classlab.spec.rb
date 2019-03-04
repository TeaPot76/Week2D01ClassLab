require('minitest/autorun')
require('minitest/rg')
require_relative('../classlab')


class TestStudent < MiniTest::Test

  def test_student_name
    student = Student.new("Pim", "E29")
    assert_equal("Pim", student.name)
  end
  def test_student_cohort
    student = Student.new("Pim", "E29")
    assert_equal("E29", student.cohort)
  end

  def test_set_student_name
    student = Student.new("Pim", "E29")
    student.name = "Bob"
    assert_equal("Bob", student.name)
  end
  def test_set_student_cohort
    student = Student.new("Pim", "E29")
    student.cohort= "E30"
    assert_equal("E30", student.cohort)
  end
  def test_student_talk
    student = Student.new("Pim", "E29")
    # student.talk
    assert_equal("I can talk", student.talk)
  end
  def test_set_student_fav_lang
    student = Student.new("Pim", "E29")
    # student.fav_lang("Ru")
    assert_equal("My fav lang is Ru", student.fav_lang("Ru"))
  end
end




class TestSportsTeam < MiniTest::Test
  def test_players
    team = SportsTeam.new(['Al', 'Bob', 'Jon'], 'Stuart')
    assert_equal(['Al', 'Bob', 'Jon'], team.name_array)
  end

  def test_coach
    team = SportsTeam.new(['Al', 'Bob', 'Jon'], 'Stuart')
    assert_equal('Stuart', team.coach)
  end

  def test_set_coach_name
    team = SportsTeam.new(['Al', 'Bob', 'Jon'], 'Stuart')
    team.coach = "Barry"
    assert_equal("Barry", team.coach)
  end

  def test_set_add_name
    team = SportsTeam.new(['Al', 'Bob', 'Jon'], 'Stuart')
    team.add_name("Dean")
    assert_equal(['Al', 'Bob', 'Jon', 'Dean'], team.name_array())
  end

  def test_check_name?
    team = SportsTeam.new(['Al', 'Bob', 'Jon'], 'Stuart')
    result = team.check_name?("Al")
    assert_equal(true, result)
  end
  def test_add_points
    team = SportsTeam.new(['Al', 'Bob', 'Jon'], 'Stuart')
    result = team.add_points("win")
    assert_equal(1, result)
  end
end

class TestLibrary < MiniTest::Test
  def setup
    @library = Library.new
    @book = { title: "game_of_the_thrones", rental_details: {
      student_name: "Bob",
      date: "02/12/16"}}
  end

      def test_find_book
      @library.add_book(@book)
        result = @library.find_book("game_of_the_thrones")
        assert_equal(@book, result )
      end

      def test_find_book_rental_details
      @library.add_book(@book)
        result = @library.find_book_rental_details("game_of_the_thrones")
        rental_details = {
          student_name: "Bob",
          date: "02/12/16"}
        assert_equal(rental_details, result )
      end

      def test_add_book

        @library.add_book(@book)
        assert_equal(@book, @library.books[0] )
      end

      def test_add_book_by_title

        book_2 = { title: "Xmen", rental_details: {
          student_name: "",
          date: ""}}
        @library.add_book_by_title("Xmen")
        assert_equal(book_2, @library.books[0])
      end

    def test_change_rental_details

      new_rental_details = { title: "game_of_the_thrones", rental_details: {
        student_name: "Tom",
        date: "00000"}}
      @library.add_book(@book)
      @library.change_rental_details("game_of_the_thrones", new_rental_details)

        assert_equal(new_rental_details, @library.books[0])
    end


    end
