defmodule TossContainer.MixProject do
  use Mix.Project

  def project do
    [
      app: :toss_container,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TossContainer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:file_system, "~> 0.2.4"},
      {:httpoison, "~> 1.0.0"},
      {:credo, "~> 0.9.0", only: [:dev, :test]}
    ]
  end
end
