require 'httparty'
require 'json'

module HttpRequester
  class Requester
    include HTTParty
    base_uri "https://jsonplaceholder.typicode.com"

    def self.get_user(id)
      response = get("/users/#{id}")
    end

    def self.create_user(data)
      options = {
        headers: {"Content-Type" => "application/json"},
        body: data.to_json
      }
      response = post("/users", options)
    end

    def self.update_user(data, id)
      options = {
        headers: {"Content-Type" => "application/json"},
        body: data.to_json
      }
      response = patch("/users/#{id}", options)
    end

    def self.delete_user(id)
      response = delete("/users/#{id}")
    end
  end
end
