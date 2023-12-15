defmodule FakeCatalog do
  alias Supermarket.Model.SupermarketCatalog
  defstruct products: %{}, prices: %{}

  defimpl SupermarketCatalog do
    def add_product(catalog, product, price) do
      catalog
      |> Map.update!(:products, &Map.put(&1, product.name, product))
      |> Map.update!(:prices, &Map.put(&1, product.name, price))
    end

    def get_unit_price(catalog, product) do
      catalog.prices[product.name]
    end
  end
end
