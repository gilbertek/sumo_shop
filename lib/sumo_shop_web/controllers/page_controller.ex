defmodule SumoShopWeb.PageController do
  use SumoShopWeb, :controller

  alias SumoShop.Inventories

  def index(conn, _params) do
    products = Inventories.list_products()
    render conn, "index.html", products: products
  end
end
