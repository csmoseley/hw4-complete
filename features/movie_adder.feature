Feature: create movies
 
  As an obsessive editor
  So I can add movies at will
  I want to create movies

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminater          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

Scenario: attempt delete the Terminator due to typo
	Given I am on the home page
	When I check the following ratings: G,PG,R,PG-13,NC-17
	And I press "ratings_submit" 
	Then I should be on the home page
	And I should see all the movies
	When I follow "More about The Terminater"
	Then I am on the details page for "The Terminater"
	And I follow "Delete"

Scenario: create Terminator Salvation
	Given I am on the home page
	When I check the following ratings: G,PG,R,PG-13,NC-17
	And I press "ratings_submit" 
	Then I should be on the home page
	And I should see all the movies
	When I follow "Add new movie"
	Then I am on the new movie page
	When I fill in "movie_title" with "Terminator Salvation"
	And I select "R" from "movie_rating"	
	And I select "2009" from "movie_release_date_1i"
	And I select "May" from "movie_release_date_2i"
	And I select "21" from "movie_release_date_3i"
	And I press "Save Changes"
	Then I am on the home page
	And I should see "Terminator Salvation"
	

