defmodule RackspaceBackup do

  require Logger

  def backup(container) do
    Rackspace.Api.CloudFiles.Object.list(container)
    |> do_backup(container)
  end

  def do_backup([], _container), do: []
  def do_backup([f|tail], container) do
    path = generate_path(container, f.name)
    file = Rackspace.Api.CloudFiles.Object.get container, f.name
    write_file(path, file)
    do_backup(tail, container)
  end

  def generate_path(container, path) do
    pt = String.split(path, "/")
    create_path = "#{container}/" <> do_generate_path(pt)
    ensuere_exists!(create_path)
    file = Enum.reverse(pt) |> hd()
    %{path:  create_path, file: file}
  end

  def do_generate_path([_file]), do: ""
  def do_generate_path([p|tail]) do
    p <> "/" <> do_generate_path(tail)
  end

  defp ensuere_exists!(path) do
    if Elixir.File.exists?(path), do: true, else: Elixir.File.mkdir_p! path
  end

  defp write_file(path, file) do
    Logger.info "downloading #{file.name}"
    name = path.path <> path.file
    {:ok, f} = File.open(name, [:write])
    IO.binwrite(f, file.data)
    File.close(f)
  end
end
