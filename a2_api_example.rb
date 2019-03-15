require 'dotenv/load'
require 'httparty'
require 'json'

# Configure API endpoints/auth
raise "set ENV['A2_API_TOKEN'] before running" unless ENV['A2_API_TOKEN']
api_token = ENV['A2_API_TOKEN']
a2_server = ENV['A2_SERVER'] || 'a2.dayold.pizza'
api_endpoint = "https://#{a2_server}/api/v0"
headers = {
  'User-Agent': 'Ruby A2 API Example',
  'Content-Type': 'application/json',
  'api-token': api_token
}

# Get Chef Node Summary
url = "#{api_endpoint}/cfgmgmt/stats/node_counts"
response = HTTParty.get(url, headers: headers, verify: ! ENV['IGNORE_SSL'])
puts "Node Counts:\n#{JSON.pretty_generate(JSON.parse(response.body))}\n\n"

# Get Chef Run Summary
url = "#{api_endpoint}/cfgmgmt/stats/run_counts"
response = HTTParty.get(url, headers: headers, verify: ! ENV['IGNORE_SSL'])
puts "Run Counts:\n#{JSON.pretty_generate(JSON.parse(response.body))}\n\n"

# Get Compliance Summary
url = "#{api_endpoint}/compliance/reporting/stats/summary"
response = HTTParty.post(url, headers: headers, verify: ! ENV['IGNORE_SSL'])
puts "Compliance Summary:\n#{JSON.pretty_generate(JSON.parse(response.body))}\n\n"
