# Notes

## Project Idea:

### Project Description:

Create a running app to help motivate a _User_ to reach their run goals.

###Models

####User
Attributes: 
- username
- email
- run_goal
- password

Associations:
- has_many :runs

####Run
Attributes:
- distance
- time
- shoes
- notes
- indoor_outdoor
- user_id
- date (stretch goal)

Associations:
- belongs_to :user

Stretch Goals:
- [ ] Add 'See How You Compare' page
- [ ] Add option to edit run goal on 'Sarah' (edit profile) page
- [X] Change Outdoor / Indoor to dropdown input
- [x] Add average pace (time / miles)

### Project Requirements:

- [X] Build an MVC Sinatra application.
- [X] Use ActiveRecord with Sinatra.
- [X] Use multiple models.
- [X] Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
- [x] Must have user accounts - users must be able to sign up, sign in, and sign out.
- [X] Validate uniqueness of user login attribute (username or email).
- [x] Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
- [x] Ensure that users can edit and delete only their own resources - not resources created by other users.
- [x] Validate user input so bad data cannot be persisted to the database.
- [ ] Blog post.
- [ ] BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)
