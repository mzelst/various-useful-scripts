require(rtweet)
require(tidyverse)
token <- create_token(app="",
                      consumer_key = "",
                      access_token = "",
                      consumer_secret = "",
                      access_secret = "")

get_token()

followers <- get_followers("username",n="all",retryonratelimit = T)

profiles <- lookup_users(followers$user_id)

follower_database <- profiles %>%
  select(user_id = user_id,name,location,account_created_at,verified,followers_count,statuses_count,
         screen_name,number_tweets = statuses_count,following_count = friends_count,
         followers = followers_count,bio = description)
