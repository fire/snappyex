defmodule Snappyex.Mixfile do
  use Mix.Project

  def project do
    [app: :snappyex,
     version: "0.0.2",
     thrift: [
       files: Path.wildcard("thrift/**/*.thrift"),
       output_path: "lib/thrift/"
     ],
     elixir: "> 1.4.0",
     compilers: [:thrift | Mix.compilers],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :db_connection],
     mod: {Snappyex.App, []}]
  end

  defp deps do
    [{:dialyxir, "~> 0.3.5", only: [:dev]},
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
     {:db_connection, "~> 1.1.0"},
     {:thrift, github: "pinterest/elixir-thrift"}
    ]
  end
end
