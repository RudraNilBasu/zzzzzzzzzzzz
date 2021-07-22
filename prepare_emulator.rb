require 'json'
require 'rest-client'# require 'restclient'

def upload
  appetize_api_token = "tok_etjz5vz25n24ea9ty2hp0ny87w";
  app_public_key = 'v3yy4eh968p206n3ymm5e3a56m'
  appetize_url = "https://#{appetize_api_token}@api.appetize.io/v1/apps/#{app_public_key}"

  begin
    data = {}
    # data[:file] = File.new('/Users/rudra/AndroidStudioProjects/Octavia/app/build/outputs/apk/debug/app-debug.apk', 'rb')
    data[:file] = '@/Users/rudra/AndroidStudioProjects/Octavia/app/build/outputs/apk/debug/app-debug.apk'
    data[:platform] = 'android'
    puts data.to_json
    # response = RestClient.post(appetize_url, data: data.to_json)
    request = RestClient::Request.new(
      :method  => :post,
      :url     => appetize_url,
      :payload => {
        :multipart => true,
        :file => File.new('/Users/rudra/AndroidStudioProjects/Octavia/app/build/outputs/apk/debug/app-debug.apk', 'rb'),
        :platform => 'android'
      }
    )

    response = request.execute

    if response.code == 200
      public_key = JSON.parse(response.body)['publicKey']
      html_preview_contents = "<html><body><iframe src=\"https://appetize.io/embed/#{public_key}\" width=\"378px\" height=\"800px\" frameborder=\"0\" scrolling=\"no\"></iframe> </body></html>"
      File.write('/Users/rudra/AndroidStudioProjects/Octavia/preview.html', html_preview_contents)
    end
    # puts "Response Code: #{response.code}"
    # puts "Response: #{response.body}"
  rescue RestClient::Exception, RestClient::Forbidden => e
    puts e
    puts e.http_body
  end
end

upload
