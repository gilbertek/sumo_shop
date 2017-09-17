defmodule SumoShop.Repo.Migrations.CreateProductAssets do
  use Ecto.Migration

  def change do
    create table(:product_assets) do
      add :type, :integer
      add :extension, :string
      add :assset_path, :string
      add :asset_description, :string
      add :assoc_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:product_assets, [:assoc_id])
  end
end
