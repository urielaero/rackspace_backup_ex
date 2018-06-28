defmodule RackspaceBackup.Cli do

  require Logger
  def main(argv \\ []) do
    case arg(argv) do
      {:error} -> Logger.error "Missing container name use: ./rackspace_backup container"
      {:ok, container} -> RackspaceBackup.backup(container)
    end

  end

  def arg([]), do: {:error}
  def arg([container]), do: {:ok, container}

end
