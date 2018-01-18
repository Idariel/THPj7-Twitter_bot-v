# ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'


#Necessite de mettre les tokens à la main
p "consumer_key stp ?"
twitter_consumer_key = gets.chomp
p "consumer_secret stp ?"
twitter_consumer_secret = gets.chomp
p "consumer_token stp ?"
twitter_consumer_token = gets.chomp
p "consumer_token_secret stp ?"
twitter_consumer_token_secret = gets.chomp

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_consumer_key
  config.consumer_secret     = twitter_consumer_secret
  config.access_token        = twitter_consumer_token
  config.access_token_secret = twitter_consumer_token_secret
end

#p client

# ligne qui permet de tweeter
client.update('Bonjour monde')


#Streaming authorization
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

#.take(10) est rajouté pour n'afficher que 10 tweet sinon pb d'arrêt
topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end

#liker une liste de journalistes
