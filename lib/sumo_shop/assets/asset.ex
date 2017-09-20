defmodule SumoShop.Assets.Asset do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias SumoShop.Assets.Asset


  schema "abstract table: assets" do
    field :asset_description, :string
    field :assset_path, :string
    field :extension, :string
    field :type, :integer
    field :assoc_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Asset{} = asset, attrs) do
    asset
    |> cast(attrs, [:type, :extension, :assset_path, :asset_description])
    |> validate_required([:extension, :assset_path, :asset_description])
  end
end
