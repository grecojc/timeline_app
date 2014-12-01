task :get_tweets => :environment do

	news_source_screen_names = []
	news_sources = NewsSource.all
	num_news_sources = NewsSource.count
	x = 0
	while x < num_news_sources
		news_source_screen_name = news_sources[x].screen_name
		news_source_screen_names << news_source_screen_name
		x += 1
	end

	all_news_source_tweets = news_source_screen_names.map {|z| $twitter.user_timeline(z, count: 200)}

	x = 0
	y = 0
	while x < 200 and y < num_news_sources
		unless Tweet.exists?(:tweet_id => all_news_source_tweets[y][x].id)
		Tweet.create(:screen_name => all_news_source_tweets[y][x].user.screen_name, :text => all_news_source_tweets[y][x].text, :time_stamp => all_news_source_tweets[y][x].created_at, :tweet_id => all_news_source_tweets[y][x].id)
		end
		x +=1
		if x == 199
		y += 1				
		x = 0
		end
	end
end