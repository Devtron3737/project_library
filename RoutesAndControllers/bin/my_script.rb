require 'addressable/uri'
require 'rest-client'



# my_script.rb
# def update_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users/1.json'
#   ).to_s
#
#   # begin
#   puts RestClient.patch(
#     url,
#     { user: { name: "newguy", email: "newguy@email"} }
#   )
#   # rescue
#     # raise "please put in the right parameters"
#   # end
# end
#
#
#
# update_user








#
#
#
#
# my_script.rb
def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
  puts RestClient.patch(
    url,
    { user: { username: "devin"} }
  )
  rescue
    raise "please put in the right parameters"
  end

end

create_user
