class Chitter
  get '/' do
		@chits = Chit.all.sort_by(&:created_at).reverse
		haml :index
  end
end
