require "httparty"
require "pry"
require "json"

class Client
	include HTTParty
	base_uri "http://10.138.195.229:4567"

	def test_it
		Client.get("/api/test")
	end

	def samplelist
		print "What do you want to play? Type one of the following:\n"
		print "After1	Ever1	Hour2		MoreThan3	Over2		WorkIt2 \n"
		print "After2	Ever2	Hour3		Never1		Over3 \n"
		print "After3	Ever3	MakeIt1		Never2		Stronger1 \n"
		print "beat		Faster1	MakeIt2		Never3		Stronger2 \n"
		print "Better1	Faster2	MakesUs1	Our1		WorkIs1 \n"
		print "Better2	Harder1	MakesUs2	Our2		WorkIs2 \n"
		print "DoIt1	Harder2	MoreThan1	Our3		WorkIs3 \n"
		print "DoIt2	Hour1	MoreThan2	Over1		WorkIt1 \n"
		print "In this format: client.play(_____) \n"
		print "Also client.killit to stop playback \n"
	end

	def killit
		Client.get("/stop")
	end

	def play(sample)
		Client.get("/play/#{sample}")
	end

	def playversion(sample, version)
		Client.get("/play/#{sample}#{version}")
	end

	def playall
		Client.get("/play/all")
	end

	def after(version)
		Client.get("/after", query: { "v": version })
	end
end




client = Client.new

client.samplelist

binding.pry

#client.samplelist


#binding.pry



#client = Client.new
#client.play("Harder2")
#client.play("beat")
