json.array!(@movie_reqs) do |movie_req|
  json.extract! movie_req, :id, :title, :genre, :director, :actor1, :actor2, :actor3, :releaseyr, :rating, :description
  json.url movie_req_url(movie_req, format: :json)
end
