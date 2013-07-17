require 'rubygems'
require 'oauth'

def connect_to_twitter
	consumer_key = OAuth::Consumer.new(
		"pJHWzsuHvHADbHCQez3Ww",
		"79wWRZ6U50MaeD4laa45vsltCur9GRdq7d5ogm9Xfxw"
	)
	access_token = OAuth::Token.new(
		"778587566-jD1eJnwXtlZOeAw5Pq3BTMaLKXpKsV9tlbaRXM0V",
		"y7J9feftUgAspu0ZnkTgGvMEzOj7GfuNAGvWurGNQ"
	)

	baseurl = "https://api.twitter.com"

	address = URI("#{baseurl}/1.1/accoutn/verify_credentials.json")

	http = Net::HTTP.new address.host, address.port
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_PEER 	

	request = Net::HTTP::Get.new address.request_uri
	request.oauth! http, consumer_key, access_token

	http.start
	response = http.request request
	puts "the response status was #{repsponse.code}"

end

connect_to_twitter
