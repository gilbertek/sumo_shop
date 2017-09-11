defmodule SumoShop.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias SumoShop.Accounts.User


  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :status, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :username, :status, :password_hash])
    |> validate_required([:first_name, :last_name, :email, :username, :status, :password_hash])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
