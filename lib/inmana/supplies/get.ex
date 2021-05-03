defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    Supply
    |> Repo.get(uuid)
    |> handle_insert()
  end

  defp handle_insert(%Supply{} = result), do: result
  defp handle_insert(nil), do: {:error, %{result: "Supply not found", status: :not_found}}
end
