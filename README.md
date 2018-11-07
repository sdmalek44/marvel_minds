# :city_sunset: **MARVEL MINDS** 

## About
  - Marvel Minds web application to help children 12 and under learn about Marvel characters, comic book series, and keep a list of their favorite ones. It also includes a matching card memory game where a user tries to remember what faces lie behind each card. The project was developed using Ruby 2.4.3, Rails 5.2.1. and JavaScript. See it live [here](https://marvel-minds.herokuapp.com).  

## Pages

- [Main Page](#Main-Page)
- [Characters Search Page](#Characters-Search-Page)
- [Characters Show Page](#Characters-Show-Page)

## Local Setup
If you would like to set up this project locally please make sure you have Ruby and Rails installed on your machine first and then follow these steps:  
  - `git clone https://github.com/sdmalek44/marvel_minds.git`  
  - `cd marvel_minds`   
  - `bundle` or `bundle exec`  
  - `rake db:{create,migrate}`  
  - `rails s`  
Now the project should be available to view at [localhost:3000](https://localhost:3000/)

If you would like to run the test suite:
  - `rspec`


## Main Page
#### `/`
  - Landing page where user can access characters, series, favorites, and game pages.
  <img width="1238" alt="screen shot 2018-11-06 at 10 24 13 pm" src="https://user-images.githubusercontent.com/30483194/48112664-adecca00-e214-11e8-98ea-42747fd2d64c.png">


## Characters Search Page
#### `/characters`
- Allows you to search characters by name or choose a letter to get characters that start with that letter. 
<img width="1672" alt="screen shot 2018-11-06 at 10 25 22 pm" src="https://user-images.githubusercontent.com/30483194/48112730-01f7ae80-e215-11e8-856d-984de6697df1.png">


## Characters Show Page
#### `/characters/:character_id`
  - returns title and description of character with large photo
  - returns series and events related to that character
  - if signed in a user can add character to favorites
  <img width="1665" alt="screen shot 2018-11-06 at 10 29 15 pm" src="https://user-images.githubusercontent.com/30483194/48112826-687ccc80-e215-11e8-86e9-1ec96545159e.png">


