# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SumoShop.Repo.insert!(%SumoShop.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SumoShop.Repo
alias SumoShop.Inventories.Product

defmodule H do
  import Ecto.Query

  def first_or_create(schema, data) do
    q = from i in schema, where: i.name == ^data.name
    Repo.one(q) || Repo.insert!(data)
  end
end

1..25
|> Enum.map(fn(x) ->
    upc = :rand.normal
    p = H.first_or_create(
      Product,
      %Product{name: "Product #{x}",
        description: "Awesome product #{x}",
        quantity: 5,
        status: 1,
        upc: "#{upc}.#{x}"}
    )
end)

# mix phx.gen.context Assets Asset product_assets assoc_id:references:products type:integer extension:string assset_path:string asset_description:string
