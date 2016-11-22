# NERT Forum
## Scope
The NERT Forum is a place to encourage involvement, engagement and community among graduates of the [NERT Program](http://sf-fire.org/neighborhood-emergency-response-team-nert). Users can contribute to the community conversation by creating Posts and Commenting on these Posts. They can also create Events -- from small gatherings like Potlucks and Meet-ups for Coffee to big events list Volunteer Opportunities, Skill Building Workshops and Block Parties. Users can Join these events and post Comments to contribute to and start discussion around these meet-ups.

## Technologies
- Ruby on Rails
- Javascript
- JQuery
- [Devise](https://github.com/plataformatec/devise) for Auth
- [Materialize](http://materializecss.com)
- [Paperclip](https://github.com/thoughtbot/paperclip)
- [[Possibilities for Stretch]]
  - [Friendly ID](https://github.com/norman/friendly_id)

## User Stories
See User Stories and progress on [Trello](https://trello.com/b/6cLSglKz/nert-forum)

Initial User Stories on [Google Drive](https://drive.google.com/open?id=0BwFLR37h9aikVDFUNXNWUDZmbjA)

## Wireframes
Wireframes on [Google Drive](https://drive.google.com/drive/u/0/folders/0BwFLR37h9aikbUMwS2FLTmNOM00)


## Data Models
![Data Models](https://lh3.googleusercontent.com/pvjjQ42PdA8BflQ3TpLSFcXyZMdzJnBduQggSutZ2oR128dz1RroQFtK1Fgm3zwR4_2kp6jmXtidx77fTasQ32q_yq3eSA5m9MzkJFHbR4gnVVj1wQvugx6dCb9MnIQBArV7mpYxTbRyVAxWM3nfq8mAQlM4wwPMB3RZN5rBUmpi3kkw0DepBJZ_n6bFwMPV5SeYfqXrP3B23ioejPsE1I2sIb0ONk7oe1TPgmTZ3eG5aFHReOUSYAUCaK27HsPKwZ-XcwTgsUcjrLyBRWEIMrKBhRjtuSdQGXZB8YDRjKdNr4JAzoMF0GZMXe_DeRKsyBiDiLJAx_vtTOCB6M91dNJYy3PyugJMqdckvyk9uY38T3-tXL6s_UUuOct-G39jPB-19nqU3l5GF5m0wYjiehx4tSZZQFwHdxo_7yH3NBfVva4uCbJfTQdrJXnftFe6AmatGhQIjxeHYGun-sfCGQV-ib17l7D7Ilfweq193LCN3zDNpiPGwNDRT6kKoIyA-cesPT7jBDBWNx3hot1rG17rFhc0QDhsHMSsfoMTd8AfdRfGvsRV2OyCH-1p3xS_vfyMGl4Z=w2548-h1398)

## User Auth
When a User is created, they are given a type:

- Volunteer
- Admin

### Volunteer Auth

Can:

- View Profiles, Posts, Events
- Edit Own Profile
- Join an Event
- Create a Post
- Edit/Delete Own Posts
- Create Comments on Posts and Events
- Change Password

### Admin Auth

(Inherits all Auth of Volunteer, **PLUS**)

Can:

- Create an Event
- Edit/Delete Own Events
- Add New User
- Delete Users

## Milestones/Sprints
 
### Sprint One
- Create Users
- Create User Profile
- Allow Edit and Deletion of User Profiles
- Create Posts and Comments
- Create Relationship between Posts and Comments
- Create Post Show
- Create Home Page to show Recent Posts

### Sprint Two

- Create Login flow for Users
- Create Sign Up flow for Admin Users
- *[if LoggedIn && User == Post.Owner]* Allow Post Edit/Delete
- *[if LoggedIn]* Allow Add Comments
- *[if LoggedIn && User == Comment.Owner]* Allow Edit/Delete Comments
- Create Update Password flow for Volunteer Users
  - http://stackoverflow.com/questions/25186075/allowing-user-to-change-password-with-devise-rails-4
  - http://stackoverflow.com/questions/6928461/devise-allowing-users-to-change-passwords

### Sprint Three
- Create Events
- Create Relationship between Event and Comments
- Create Event Show
- *[if LoggedIn && User == Event.Owner]* Allow Event Edit/Delete
- *[if LoggedIn]* Allow Add Comments
- *[if LoggedIn && User == Comment.Owner]* Allow Edit/Delete Comments

### Sprint Four
- Update Home Page to show Recent Events
- Create Relationship between Event and Attendees
- Allow User to 'Join' Event