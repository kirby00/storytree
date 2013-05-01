README.md

Welcome to Story-Tree

=====================

Story-Tree is a social story sharing application.

Users can start a story by composing a short introduction and letting others submit ideas for how the narrative should continue. Each of these additions gets added to a round. The first addition to win 5 votes becomes the next section of the story and users can then propose further additions in the next round.

Users can sign in with Facebook and 'like' each other's contributions. Additionally, creating a story automatically posts to the author's Facebook wall. Users can restrict who can view these posts when they first authorise the Story-Tree app on Facebook.

=====================

Story-Tree was created by Rob Boyland and Max Kirby at Makers Academy in April 2013. The purpose of the project was to explore Facebook integration, database relations in ActiveRecord, and voting functionality.

Hence, Story-Tree uses Facebook in 3 ways:
i) Most simply, the 'like' social plugin
ii) Facebook sign-in using Omniauth
iii) The Graph API using Facebook's JS SDK

It also utilizes the Thumbs-Up gem. By using ActiveRecord relations appropriately, we were able to remove virtually all database queries in the models.