Original App Design Project - README Template
===

# MeetUp

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
MeetUp is an app that instantly connects you with people around you. Unlike Tinder and Bumble, which are mainly aimed at forming romantic relationships which makes people more reluctant to chat with others, MeetUp is about meeting someone new for a coffee, lunch, or even just exchanging talks about a subject that both users are interested in, all easily and with no hassle. The instantaneous aspect of MeetUp (to immediatly find someone to meet on the spot) is one of the app's important features, which are hard to provide in other geosocial networking applications.

### App Evaluation
- **Category:** Geosocial networking
- **Mobile:** The concept is most suitable to be applied on a mobile device, where one is able to use it instantly anywhere. The app relies on the idea that it is real-time and easy to access. Whenever you're bored you can instantly use it anywhere.
- **Story:** Getting to know new people and forming valuable connections might be hard to a fair amount of us, and quarantine season didn't help the cause at all since most of us were unable to go out or even get together with friends.
- **Market:** The market virtually includes everyone, but we believe that it is going to be most popular among teenagers and young adults, specifically college students. This group of people will use it to get to know new friends with common interests (maybe even introduce them to new exciting interests) and interesting personalities, allowing them to form new connections. The app will be helpful not only to social butterflies since it provides ease of access, but also to those who may struggle with initiating social connections since it provides a starting point for forming these connections. It also serves as a good starting point for people who just arrived at a new city/campus/etc to kickstart their social lives.
- **Habit:** The idea of how habit-forming this app is will depend on the users. Since it is easy to access immediately, people could use it everytime they are waiting outside for something, are just generally bored, or are actively trying to get to know new people. Additionally, people can use habitually for things like having a gym buddy or somebody to eat with.
- **Scope:** The app's idea is relativley simple and easy to implement. It would require sign in/up screens where you can also sign in/up with exisitng social media accounts, then it would provide a stream of MeetUp requests that would provide more details to the user about the inviter (Interests, where to meet up, etc...)

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
- [x] User can sign in
- [x] User can sign up
- [x] User is taken to a screen to create their profile
- [x] User can view active invites
- [x] User can accept invites
- [x] User can view who accepted the invite
- [x] User is requested access to notifications
- [x] User is requested access to camera roll 
- [x] Page for user to post invites
- [x] User can post invites with their data being stored in the database
- [x] Page for user to create/edit profile
- [x] User is able to upload their own images
- [x] Users can create/edit their profiles with the change reflecting in the database
- [x] User can log out
- [x] User can delete their account
- [x] User can see app icon
- [x] User can see a styled launch screen

**Optional Nice-to-have Stories**

* A quick ice breaker game to ease into the conversation 
* A Spotify/Apple playlist option
* An Instagram profile preview
* Messaging/chat


### 2. Screen Archetypes

* Login
* Signup 
    * Users are prompted to sign up after downloading the app. Access to the rest of the app is given after they successfully register. 
* Stream
    * A list of users who have an open invitation based on the nearby locations
* Profile Screen 
    * Allows the user to upload a profile photo.
    * Shows the user’s interests, and hobbies
* Setup Details
    * This is where the user sets up an invite. They add a max number of people who can accept the invite, location, date and time and special notes.
* Invite Details
    * Where a user can view the details of an invite and accept if interested 
* Edit Invite
    * Where the user can edit their invite, change time, location or close it.


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Invites(stream)
* Profile
* Settings

**Optional**
* Chat



**Flow Navigation** (Screen to Screen)

* Login Screen
  * Invite Stream
* Registration Screen
  * Invite Stream
* Invite Stream 
  * Invite Details, date time and location
* User Profile
  * Profile photo, user and hobbies as well as list of previous invites
* Set up invite
  * Invite set up screen
  * Invite Stream
* Settings
  * User profile


## Wireframes
<img src="MeetUp_Wireframe.png" width=600>


## Schema 
### Models
#### Users

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | Userid | Integer | Unique identifier across tables for each user |   
   | Username | String | Username to be used for identification in invites and login |
   | Password | String | Used for logging in |

#### Profiles

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | Full Name | String | User’s first and last name |
   | College | String | College user attends |
   | Major | String | User’s major |
   | Year | String | User’s current year in college |
   | Interests | String | User’s interests |
   | Userid | Integer | Unique identifier for each user |
   | Bio | String | User’s bio |
   | Profile Image | File | Image uploaded by user |

#### Invites

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userid | integer | ID of users that post them |
   | inviteid | integer | identifier for each invite |
   | time | string | time user wants to hangout |
   | location | string | whether the user wants to meet |
   | status | bool | status of invite, active or inactive |
   | invite details | string | users description of invite |
   | date | date date of the meet up |





 
### Networking
#### List of network requests by screen
   - login screen
      - (Read/GET) Verify that the user exists in the database and the password is correct
   - sign up screen
      - (POST) register the user's details (first and last names, username, password) into the database
   - invite stream screen
      - (Read/GET) query active invites from the database
   - invite details screen
      - (Read/GET) query active invites from the database
   - user profile screen
      - (Read/GET) query the selected invite from the database to show its details on the screen
   - edit profile screen
      - (POST/GET) query the current user's profile from the database and post the changes to the database again
   - create invites screen
      - (POST) post the invite's details to the database
   - previous invites screen
      - (Read/GET) query both active and inactive invites of the user from the database
   - edit invite screen
      - (POST/GET) query the selected invite from the database and post the changes to the database again

### Progress GIFs
#### Week 1
We are already done with designing most of the screens. By this monday, we will have finished them all and we will be moving to work on the code and integrating the different parts to work together as intended.
![](https://github.com/MeetUpAppGroup/MeetUp/blob/main/ezgif.com-video-to-gif-3.gif)
![](https://github.com/MeetUpAppGroup/MeetUp/blob/main/ezgif.com-video-to-gif-4.gif)

![](https://github.com/MeetUpAppGroup/MeetUp/blob/main/sprint3.gif)

![Last sprint demonstration](https://github.com/MeetUpAppGroup/MeetUp/blob/main/Screen%20Recording%202021-04-25%20at%2011.32.39%20PM.gif)

