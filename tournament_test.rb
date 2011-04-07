require 'test/unit'
require 'tournament'

# TODO use fakeweb to mock yahoo requests

class TournamentTest < Test::Unit::TestCase
  
  def setup
    @t = Tournament.new(2011,15)
  end

  def test_year
    assert_equal 2011, @t.year
  end

  def test_id
    assert_equal 15, @t.id
  end

  def test_title
    assert_equal "The Masters", @t.title
  end

  def test_location
    assert_equal "Augusta, GA", @t.location
  end

  def test_status
    assert_equal "Upcoming", @t.status
  end

  def test_par
    assert_equal "72", @t.par
  end

  def test_course
    assert_equal "Augusta National", @t.course
  end

  # TODO test cacheing
  # TODO test downloading
  # TODO test download error handling
  # TODO test parse error handling

end