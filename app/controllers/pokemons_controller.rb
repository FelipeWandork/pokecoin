class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show edit update destroy ]

  require "rest-client"
  require "json"

  # GET /pokemons or /pokemons.json
  def index

    @pokemon = Pokemon.all

  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
    @pokemons  = request_api['results']
    @price_btc = price_btc['price_24h']
    @in_dollar = converter_satoshi_dollar(@pokemon['value_satoshi'])
  end

  # GET /pokemons/new
  def new
    @pokemons = request_api['results']
    @price_btc = price_btc['price_24h']
    @pokemon  = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons or /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)
    historic = HistoricController.new
    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to pokemon_url(@pokemon), notice: "Pokemon was successfully created." }
        format.json { render :show, status: :created, location: @pokemon }
        format.js # views/pokemons/create.js.erb
        historic.write("Novo Pokemon", @pokemon)
  
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1 or /pokemons/1.json
  def update
    historic = HistoricController.new
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to pokemon_url(@pokemon), notice: "Pokemon was successfully updated." }
        format.json { render :show, status: :ok, location: @pokemon }
        historic.write("Atualização Pokemon", @pokemon)
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1 or /pokemons/1.json
  def destroy
    historic = HistoricController.new
    @pokemon.destroy

    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: "Pokemon was successfully destroyed." }
      format.json { head :no_content }
      historic.write("Exclusão Pokemon", @pokemon)
    end
  end

  def request_api  
    offset = 0
    limit = 2000

    url = "https://pokeapi.co/api/v2/pokemon/?offset=#{offset}&limit=#{limit}"
    response = RestClient.get url
    hash = JSON.parse response
  end

  def price_btc
    url = "https://api.blockchain.com/v3/exchange/tickers/BTC-USD"
    response = RestClient.get url
    hash = JSON.parse response
  end

  def converter_satoshi_dollar(satoshi)
    in_dollar = ((satoshi.to_f / 100000000) * @price_btc).ceil(8)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:order, :name, :base_experience, :value_satoshi, :value_dolar)
    end
end
