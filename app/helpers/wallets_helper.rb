
module WalletsHelper

    def helper_sum_satoshi
        @sum = 0
        @sum_satoshi.each do |s|
            @sum = @sum + s
        end
        @sum

    end

    def helper_convert_dolar

        pokemon = PokemonsController.new
        price = pokemon.price_btc['price_24h']

        @dolar = ((@sum * price)/100000000).ceil(8)
    end
end
