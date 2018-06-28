defmodule RackspaceBackup.Mixfile do
  use Mix.Project

  def project do
    [
      app: :rackspace_backup,
      escript: escript(),
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :rackspace, :tzdata]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rackspace, github: "livehelpnow/ex-rackspace"},
      {:tzdata, "== 0.1.8", override: true}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

 defp escript do
    [main_module: RackspaceBackup.Cli]
  end
end
