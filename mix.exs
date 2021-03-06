defmodule Howitgoesbot.Mixfile do
  use Mix.Project

  def project do
    [app: :howitgoesbot,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      extra_applications: [:logger, :ecto, :postgrex],
      mod: { Howitgoesbot, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:plug_cowboy, "~>2.0"},
     {:poison, "~> 3.1"},
     {:plug, "~>1.6"},
     {:postgrex, ">= 0.11.1"},
     {:ecto, "~> 2.0"}]
  end
end
