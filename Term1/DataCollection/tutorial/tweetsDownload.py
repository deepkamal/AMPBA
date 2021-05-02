tweet_count = 0

#<Insert Keys here>
ckey="AFinLeA1pLK71aGx5z6CSH1gG"
csecret="bYeCJnOvkzROHJkt9I0Ad2MxvRvvyKgmOvLy9J8TOz4x8VgNJq"
atoken="73549143-Ebp9FLBPCNvXzOfKObpIBv0ftaEktGqqpvU02GmF2"
asecret="23hrf5AdxszAIernIkwYiJOootM2fTue11296fLtxoJPf"


# Input number of tweets to be downloaded
n_tweets = 100000
from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import json
import jsonpickle
import datetime
now = datetime.datetime.now()
oldMinute=str(now.year)+"_"+str(now.month).zfill(2)+"_"+str(now.day).zfill(2)+"_"+str(now.hour).zfill(2)+"_"+str(now.minute).zfill(2)
print(oldMinute)
f = open("tweets_"+oldMinute+".txt", "a")
class StdOutListener(StreamListener):
    def on_data(self, data):
        global tweet_count
        global n_tweets
        global stream
        global f
        global oldMinute
        #if tweet_count < n_tweets:
        if True:
            #print(data)
            tweet = json.loads(data)
            now = datetime.datetime.now()
            currMinute=str(now.year)+"_"+str(now.month).zfill(2)+"_"+str(now.day).zfill(2)+"_"+str(now.hour).zfill(2)+"_"+str(now.minute).zfill(2)
            if oldMinute!=currMinute:
                f.close()
                f = open("tweets_"+currMinute+".txt", "w")
                oldMinute=currMinute
            _=f.write(jsonpickle.encode(tweet, unpicklable=False) +'\n')
            tweet_count += 1
            return True
        else:
            stream.disconnect()
            f.close()
    def on_error(self, status):
        print(status)


# Handle Twitter authetification and the connection to Twitter Streaming API
l = StdOutListener()
auth = OAuthHandler(ckey, csecret)
auth.set_access_token(atoken, asecret)

stream = Stream(auth, l)
stream.sample(languages=["en"])
#stream.filter(languages=["en"])