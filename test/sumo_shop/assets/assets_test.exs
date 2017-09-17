defmodule SumoShop.AssetsTest do
  use SumoShop.DataCase

  alias SumoShop.Assets

  describe "product_assets" do
    alias SumoShop.Assets.Asset

    @valid_attrs %{asset_description: "some asset_description", assset_path: "some assset_path", extension: "some extension", type: 42}
    @update_attrs %{asset_description: "some updated asset_description", assset_path: "some updated assset_path", extension: "some updated extension", type: 43}
    @invalid_attrs %{asset_description: nil, assset_path: nil, extension: nil, type: nil}

    def asset_fixture(attrs \\ %{}) do
      {:ok, asset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assets.create_asset()

      asset
    end

    test "list_product_assets/0 returns all product_assets" do
      asset = asset_fixture()
      assert Assets.list_product_assets() == [asset]
    end

    test "get_asset!/1 returns the asset with given id" do
      asset = asset_fixture()
      assert Assets.get_asset!(asset.id) == asset
    end

    test "create_asset/1 with valid data creates a asset" do
      assert {:ok, %Asset{} = asset} = Assets.create_asset(@valid_attrs)
      assert asset.asset_description == "some asset_description"
      assert asset.assset_path == "some assset_path"
      assert asset.extension == "some extension"
      assert asset.type == 42
    end

    test "create_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assets.create_asset(@invalid_attrs)
    end

    test "update_asset/2 with valid data updates the asset" do
      asset = asset_fixture()
      assert {:ok, asset} = Assets.update_asset(asset, @update_attrs)
      assert %Asset{} = asset
      assert asset.asset_description == "some updated asset_description"
      assert asset.assset_path == "some updated assset_path"
      assert asset.extension == "some updated extension"
      assert asset.type == 43
    end

    test "update_asset/2 with invalid data returns error changeset" do
      asset = asset_fixture()
      assert {:error, %Ecto.Changeset{}} = Assets.update_asset(asset, @invalid_attrs)
      assert asset == Assets.get_asset!(asset.id)
    end

    test "delete_asset/1 deletes the asset" do
      asset = asset_fixture()
      assert {:ok, %Asset{}} = Assets.delete_asset(asset)
      assert_raise Ecto.NoResultsError, fn -> Assets.get_asset!(asset.id) end
    end

    test "change_asset/1 returns a asset changeset" do
      asset = asset_fixture()
      assert %Ecto.Changeset{} = Assets.change_asset(asset)
    end
  end
end
