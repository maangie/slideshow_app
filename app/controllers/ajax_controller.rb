require 'net/http'
require 'cgi'
class AjaxController < ApplicationController
  HOST  = 'www.slideshare.net'
  CACRT = (Rails.root + 'tmp/cacert.pem').to_s

  def search_slide
    api_key = Rails.application.secrets.slideshow_api_key
    secret  = Rails.application.secrets.slideshow_api_secret
    ts      = Time.now.to_i
    h       = Digest::SHA1.hexdigest(secret + ts.to_s)

    address =
      "/api/2/search_slideshows?q=#{CGI.escape(params[:keywd])}&lang=ja&"\
      "api_key=#{api_key}&hash=#{h}&ts=#{ts}"

    Net::HTTP.start(HOST, 443, use_ssl: true, ca_file: CACRT) do |https|
      res = https.get(address)
      render json: Hash.from_xml(res.body).to_json
    end
  end
end
