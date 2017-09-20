defmodule SumoShopWeb.PageController do
  use SumoShopWeb, :controller

  alias SumoShop.Inventories

  # TODO: test
  def index(conn, _params) do
    products = Inventories.list_products()
    conn
    |> assign(:products, products)
    |> render("index.html")
  end
end
