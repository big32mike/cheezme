# Planning
* greet user
* print list of recipes
* prompt for more info on a specific recipe
* print ingredients and cooking steps
* print goodbye message upon exit



## Advanced features
* grab most helpful positive and critical reviews
* recipe object, cook object
* see other recipe titles and urls by mac n cheese cooks
* recipe of the day
* most popular
* highest/lowest rated
* find or create to avoid duplicates
* make chef objects and scrape their profile page for photos, followers, recipes
* add a list of pictures
* get nutritional facts, footnotes


## Issues:
* Item 18 didn't have prep or cook time on the recipe page https://www.allrecipes.com/recipe/14140/baked-macaroni-and-cheese/
** had to test for existence of selector before adding to hash, otherwise would call nil.attr
* "Preheat oven to 350 degrees F (175 degrees C).\n                                    Watch Now
** some of the steps get this newline with Watch Now appended, have to gsub it out
* since there are 28 recipes on the page, sometimes the ingredients or steps don't scrape when doing them programmatically.

### Scratch Pad
