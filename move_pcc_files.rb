#!/usr/bin/env ruby
#
# Use this script to move files from one directory to another
#
require 'net/sftp'
require 'rest-client'

THIRD_PARTY_ID = 7 # PCC
SERVICE_DEFINITION_ID = 13 # PCC

echo $(date)

result = RestClient.get "https://www.abaqis.com/services/third_parties/#{THIRD_PARTY_ID}/service_definitions/#{SERVICE_DEFINITION_ID}",  { 'Authorization' => "Token token=\"#{ENV['API_TOKEN']}\"" }
sftp_values = JSON.parse(result)

HOSTNAME = sftp_values['hostname'] # 'trinity'
USER_NAME = sftp_values['username'] # 'ftp_account_1'
PASSWORD = sftp_values['password'] # 'Test1234'

FROM_DIRECTORY = "#{sftp_values['base_uri']}/#{sftp_values['username']}/jsh" # 'other'
TO_DIRECTORY = "#{sftp_values['base_uri']}/#{sftp_values['username']}/crg" # 'kind'

options = {
  password: PASSWORD,
  auth_methods: %w{ publickey password }
}

Net::SFTP.start(HOSTNAME, USER_NAME, options) do | sftp |
  file_list = sftp.dir.glob(FROM_DIRECTORY, '*').select { | entry | entry.file? }.map { | entry | entry.name }
  puts "The list of files: #{file_list}"
  # Now move the files in the list from one directory to another
  file_list.each do | file |
    puts "Moving file: #{file}"
    sftp.rename!("#{FROM_DIRECTORY}/#{file}", "#{TO_DIRECTORY}/#{file}")
  end
end
