defmodule SumoShop.Inventories.Product do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias SumoShop.Inventories.Product
  alias SumoShop.Assets.Asset


  schema "products" do
    field :description, :string
    field :name, :string
    field :quantity, :integer
    field :status, :integer
    field :upc, :string

    has_many :assets, {"product_assets", Asset}, foreign_key: :assoc_id

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
