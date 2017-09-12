defmodule SumoShop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :text
      add :upc, :string
      add :status, :integer
      add :quantity, :integer

      timestamps()
    end

    create unique_index(:products, [:upc])
  end
end
