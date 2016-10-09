defmodule Snappyex.Mixfile do
  use Mix.Project

  def project do
    [app: :snappyex,
     version: "0.0.1",
     elixir: "~> 1.3.3",
     compilers: [:thrift | Mix.compilers],
     thrift_files: Mix.Utils.extract_files(["thrift"], [:thrift]),
     thrift_version: ">= 0.9.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :db_connection, :timex],
     mod: {Snappyex.App, []}]
  end

  defp deps do
    [{:db_connection, "~> 1.0.0-rc.5"},
     {:riffed, github: "pinterest/riffed", tag: "v_1_5_0", submodules: true},
     {:decimal, "~> 1.1.0"},
     {:timex, "~> 3.0.8"} # Downloads tzdata every day
    ]
  end
end
