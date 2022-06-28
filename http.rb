

require_relative 'requester'

class Http
  include HttpRequester
  def get_method
    print 'Enter an ID:'
    id = gets.chomp
    response = Requester.get_user(id)
    # body = JSON.parse(response.body, symbolize_names: true)
    # info = {code:response.code, message: response.message, body: body}
    info = {code:response.code, message: response.message, body: response.body}
    puts info
  end

  def post_method
    print 'Enter a name:'
    name = gets.chomp
    print 'Enter a username:'
    username = gets.chomp
    data = {name: name, username: username}
    response = Requester.create_user(data)
    body = JSON.parse(response.body, symbolize_names: true)
    info = {code:response.code, message: response.message, body: body}
    puts info
  end

  def patch_method
    print 'Enter an id:'
    id = gets.chomp
    print 'Enter a name:'
    name = gets.chomp
    print 'Enter a username:'
    username = gets.chomp
    data = {name: name, username: username}
    response = Requester.update_user(data, id)
    body = JSON.parse(response.body, symbolize_names: true)
    info = {code:response.code, message: response.message, body: body}
    puts info
  end

  def delete_method
    print 'Enter an id:'
    id = gets.chomp
    response = Requester.delete_user(id)
    body = JSON.parse(response.body, symbolize_names: true)
    info = {code:response.code, message: response.message, body: body}
    puts info
  end
end

http = Http.new
# http.get_method
# http.post_method
# http.patch_method
http.delete_method
