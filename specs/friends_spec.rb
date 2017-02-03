require( 'minitest/autorun' )
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Marc", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      } 
    }
    
    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["soup","bread"]
      } 
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      } 
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Marc"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      } 
    }

    @person5 = {
      name: "Marc",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      } 
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  def test_name
    assert_equal("Marc", @person5[:name])
  end

  def test_favourite_show
    assert_equal("Scrubs", favourite_show(@person5))
  end

  def test_favourite_food
    assert_equal(true, favourite_food?(@person1, "charcuterie"))
    assert_equal(true, favourite_food?(@person2, "soup"))
    assert_equal(true, favourite_food?(@person2, "bread"))
    assert_equal(true, favourite_food?(@person3, "ratatouille"))
    assert_equal(true, favourite_food?(@person3, "stew"))
    assert_equal(true, favourite_food?(@person4, "spaghetti"))
    assert_equal(true, favourite_food?(@person5, "spinach"))
  end

  def test_add_friend
    expected = @person5[:friends].length + 1
    actual = add_friend(@person5, "Edith")
    assert_equal(expected, actual)
  end

  def test_remove_friend
    expected = @person1[:friends].length - 1
    actual = remove_friend(@person1, "Val")
    assert_equal(expected, actual)
  end

  def test_total_everyones_money
    assert_equal(143, total_everyones_money(@people))
  end

  def test_loan_given_value
    assert_equal(0, loan_given_value(@person3, @person2, 20))
  end

  def test_concat_all_food
    assert_equal(7, concat_all_food(@people))

  end

  def test_no_friends
    assert_equal([@person5], no_friends(@people))
  end

def test_same_favourite_tv_show
    test_array = ["Jay", "Marc", "Scrubs", "Val", "Keith", "Pokemon"]
    result_array = same_favourite_tv_show(@people)
    assert_equal(test_array, result_array)
    puts result_array
end



end
