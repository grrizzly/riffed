defmodule Rift.Mixfile do
  use Mix.Project

  def project do
    [app: :rift,
     name: "Rift",
     version: "0.1.0",
     elixir: "~> 1.0",
     deps: deps,
     compilers: Mix.compilers ++ [:thrift],
     erlc_paths: ["src", "ext/thrift/lib/erl/src"],
     erlc_include_path: "ext/thrift/lib/erl/include",
     thrift_files: Mix.Utils.extract_files(["thrift"], [:thrift]),
     docs: [output: "doc/generated"]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:thrift, :lager]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
        {:meck, "~> 0.8.2"},
        {:mock, github: "jjh42/mock"},
        {:lager, github: "basho/lager"},
        {:earmark, "~> 0.1", only: :dev},
        {:ex_doc, "~> 0.8", only: :dev}
    ]
  end
end
