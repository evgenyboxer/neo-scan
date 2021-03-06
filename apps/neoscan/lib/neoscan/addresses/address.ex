defmodule Neoscan.Addresses.Address do
  @moduledoc """
  Represent a Address in Database.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Neoscan.Addresses.Address

  schema "addresses" do
    field :address, :string
    field :balance, :map
    field :time, :integer

    has_many :claimed, Neoscan.Claims.Claim
    has_many :vouts, Neoscan.Vouts.Vout
    has_many :histories, Neoscan.BalanceHistories.History

    timestamps()
  end

  @doc false
  def changeset(%Address{} = address, attrs) do
    address
    |> cast(attrs, [:address, :balance, :time])
    |> validate_required([:address, :time])
  end

  def update_changeset(%Address{} = address, attrs) do
    address
    |> cast(attrs, [:balance])
  end
end
