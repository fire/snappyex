defmodule TcpConnection.Mixfile do
  use Mix.Project

  def project do
    [app: :tcp_connection,
     version: "0.0.1",
     elixir: "~> 1.2.2",
     compilers: [:thrift | Mix.compilers],
     thrift_files: Mix.Utils.extract_files(["thrift"], [:thrift]),
     thrift_version: ">= 0.9.3",     
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :db_connection],
     mod: {Snappy, []}]
  end

  defp deps do
    [{:db_connection, ">= 0.0.0"},
     {:riffed, github: "pinterest/riffed", submodules: true}
    ]
  end
end
