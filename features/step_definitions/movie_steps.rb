Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
		Movie.create!(movie)
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.	
	pagestr = page.body
	#puts pagestr
	#puts pagestr.match(/#{e1}[\w\W]+#{e2}/)
	assert pagestr.match(/#{e1}[\w\W]+#{e2}/)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(",").each do |rating|
		box = "ratings_" + rating
		if(uncheck)
			uncheck(box)
		else
			check(box)
		end
	end
	# HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end


#HW4
Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, director|
  movie = Movie.find_by_title(title)
  movie.director.should == director
end
		


Then /^I accept dialog$/ do
	 page.evaluate_script("window.confirm = function (msg) {
document.cookie = msg
return #{true}
}")
end
	

Then /^I should not see all the movies$/ do
  assert (0 == page.all('#movies tr').size - 1)
end

Then /^I should see all the movies$/ do
  assert (Movie.count() == page.all('#movies tr').size - 1)
end

Then /^I should not see an odd number of movies$/ do
	assert (oddness(Movie.count()).equals("even"))
end

