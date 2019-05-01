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
- Add 'See How You Compare' page

### Project Requirements:

- [ ] Build an MVC Sinatra application.
- [ ] Use ActiveRecord with Sinatra.
- [ ] Use multiple models.
- [ ] Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
- **User** _has_many_ runs, **Run** _belong_to_ a user
- [ ] Must have user accounts - users must be able to sign up, sign in, and sign out.
- [ ] Validate uniqueness of user login attribute (username or email).
- [ ] Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
- **User** has a username, email, goal, has_many **Runs**
- **Runs** has a distance, shoes, note, type, user_id (belongs_to **User**)
- [ ] Ensure that users can edit and delete only their own resources - not resources created by other users.
- [ ] Validate user input so bad data cannot be persisted to the database.
- [ ] BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)
