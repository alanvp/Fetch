class S3Controller < ApplicationController

  require 'base64'
  require 'openssl'
  require 'digest/sha1'


policy = Base64.encode64(policy_document).gsub("\n","")

signature = Base64.encode64(
    OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'), 
        aws_secret_key, policy)
    ).gsub("\n","")

end
