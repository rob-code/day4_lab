# 1. For a given person, return their favourite tv show
def favourite_show(person)
  return person[:favourites][:tv_show]
end

# 2. For a given person, check if they like a particular food
def favourite_food?(person, food)
  return person[:favourites][:things_to_eat].include?(food)
end

# 3. Allow a new friend to be added to a given person
def add_friend(person, friend)
  person[:friends].push(friend)
  return person[:friends].length
end

# 4. Allow a friend to be removed from a given person

def remove_friend(person, friend)
  if person[:friends].include?(friend)
    person[:friends].delete(friend)
  end
  return person[:friends].length
end

# 5. Find the total of everyone's money


def total_everyones_money(people)
  total_money = 0 
  for person in people
    total_money = total_money + person[:monies]
  end
  return total_money

end

# 6. For two given people, allow the first person to loan a given value of money to the other

def loan_given_value(lender, borrower, amount)
  lender[:monies] -= amount
  borrower[:monies] += amount
  return lender[:monies]
end

# 7. Find the set of everyone's favourite food joined together

def concat_all_food (people)

  all_food = []

  for person in people 
    all_food.concat(person[:favourites][:things_to_eat])
  end

  all_food.uniq!
  return all_food.length

end

# 8. Find people with no friends

def no_friends(people)
  friendless = []
  for person in people
    if person[:friends].empty?  # or .length == 0
      friendless.push(person)
    end
  end
  return friendless
end

# INSANE
# Find the people who have the same favourite tv show

def same_favourite_tv_show(people)
  favourite_tv_show = []
  result_string_array = []

  for person in people

    test_tv_show = person[:favourites][:tv_show]
    test_person = person

    for person in people

      if (person[:favourites][:tv_show] == test_tv_show) && (person != test_person)
        result_string_array.push ("#{test_person[:name]} and #{person[:name]} like #{test_tv_show}")
        favourite_tv_show.push(test_person[:name], person[:name], person[:favourites][:tv_show])
      end

    end

  end

# remove double counting in favourite_tv_show

#puts favourite_tv_show.length

enumerated_favourite_tv_show_array = []

for i in 0..favourite_tv_show.length / 3

  if !enumerated_favourite_tv_show_array.include?(favourite_tv_show[(3*i)+2]) && favourite_tv_show[(3*i)+2] != nil

    enumerated_favourite_tv_show_array.push(favourite_tv_show[(3*i)+0], favourite_tv_show[(3*i)+1], favourite_tv_show[(3*i)+2])



  end
#there may be a nil
end


return enumerated_favourite_tv_show_array
return favourite_tv_show
return result_string_array

end


