defmodule SumoShop.Inventories.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias SumoShop.Inventories.Product


  schema "products" do
    field :description, :string
    field :name, :string
    field :quantity, :integer
    field :status, :integer
    field :upc, :string

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name, :description, :upc, :status, :quantity])
    |> validate_required([:name, :description, :upc, :status, :quantity])
    |> unique_constraint(:upc)
  end
end
