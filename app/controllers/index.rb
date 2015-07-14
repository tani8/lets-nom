##Homepage
get '/' do
  erb :index
end

## READ
# index
get '/noms' do
  @noms = Nom.all
  erb :display_all
end

## Create
# new
get '/noms/new' do
  @nom = Nom.new
  erb :post_noms
end

# create
post '/noms' do
    address = params[:address].gsub(" ", "+")
  # address = "New York".gsub(" ", "+")
  response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=AIzaSyCfYs8m-XUsyrvdZUDUDc2_C3obAbTAfXI")
  @lat = JSON.parse(response.body)["results"][0]["geometry"]["location"]["lat"]
  @lon = JSON.parse(response.body)["results"][0]["geometry"]["location"]["lng"]

  @nom = Nom.create(
    food_name: params[:food_name],
    allergens: params[:allergens],
    address: params[:address],
    image_url: params[:image_url],
    amount_type: params[:amount_type],
    amount: params[:amount],
    date_made: params[:date_made],
    lat: @lat,
    lon: @lon,
  )

  redirect '/noms'
  # erb :display_all
#error bc api doesn't take into consideration addresses, only cities!


  # if request.xhr?

  # else
  #   status 404
  #   "Oops! Something went wrong yo"
  # end

end
## Update

# edit
get '/noms/:id/edit' do
  erb :edit
end

# destroy
delete '/noms/:id' do
  @nom = Nom.where(id: params[:id]).first
  @nom.destroy
  redirect '/noms'
end

