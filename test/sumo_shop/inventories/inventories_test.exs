defmodule SumoShop.InventoriesTest do
  use SumoShop.DataCase

  alias SumoShop.Inventories

  describe "products" do
    alias SumoShop.Inventories.Product

    @valid_attrs %{description: "some description", name: "some name", quantity: 42, status: 42, upc: "some upc"}
    @update_attrs %{description: "some updated description", name: "some updated name", quantity: 43, status: 43, upc: "some updated upc"}
    @invalid_attrs %{description: nil, name: nil, quantity: nil, status: nil, upc: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventories.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventories.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventories.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Inventories.create_product(@valid_attrs)
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.quantity == 42
      assert product.status == 42
      assert product.upc == "some upc"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventories.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Inventories.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.quantity == 43
      assert product.status == 43
      assert product.upc == "some updated upc"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventories.update_product(product, @invalid_attrs)
      assert product == Inventories.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventories.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventories.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventories.change_product(product)
    end
  end
end
