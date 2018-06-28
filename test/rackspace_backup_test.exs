defmodule RackspaceBackupTest do
  use ExUnit.Case
  doctest RackspaceBackup

  test "generate correct path file from f.name" do
    res = RackspaceBackup.generate_path("path_test", "upload/path1/file.jpg")
    assert res == %{path: "path_test/upload/path1/", file: "file.jpg"}
    assert Elixir.File.exists?(res.path)
  end


end
