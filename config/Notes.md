# Planning
* greet user
* print list of recipes
* prompt for more info on a specific recipe
* print ingredients and cooking steps
* print goodbye message upon exit



## Advanced features - maybe future features?
* get calories and serving size information
* grab most helpful positive and critical reviews
* recipe object, cook object
* see other recipe titles and urls by mac n cheese cooks
* recipe of the day
* most popular
* highest/lowest rated
* find or create to avoid duplicates
* make chef objects and scrape their profile page for photos, followers, recipes
* add a list of pictures


## Issues:
* Item 18 didn't have prep or cook time on the recipe page https://www.allrecipes.com/recipe/14140/baked-macaroni-and-cheese/
 - had to test for existence of selector before adding to hash, otherwise would call nil.attr
* Some scrapes of the directions brought extra characters
```
"Preheat oven to 350 degrees F (175 degrees C).\n                                    Watch Now
```
 - some of the steps get this newline with Watch Now appended, have to gsub it out
* since there are 28 recipes on the page, sometimes the ingredients or steps don't scrape when doing them programmatically.
 - I created a branch to test a fix, so I didn't break an otherwise working project.
 - I'll be using feature branches going forward when refactoring
* I should ask the user if they would like to return to the list, or break once they've viewed a recipe
* When scraping directions, there was an extra item appended to each array.

### Blog post outline
* planning
 - how I didn't plan, and procrastinated
 - hung out in study groups without
* getting started
 - then did things in the reverse order
 - trying to watch Avi's videos while distracted -> scraping logic -> objects and relations -> watching Avi's videos -> CLI interface
 - try to add github hosted code snippets to break up paragraphs

### Scratch Pad
