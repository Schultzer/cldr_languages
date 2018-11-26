defmodule CldrLanguages.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_cldr_languages,
      version: "0.2.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/LostKobrakai/cldr_languages",
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: cli_env(),
      elixirc_paths: elixirc_paths(Mix.env()),
      cldr_provider: {Cldr.Language.Backend, :define_language_module, []}
    ]
  end

  defp description do
    "ex_cldr_languages is an addon library application for ex_cldr that provides localization and listing of languages."
  end

  defp docs do
    [
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Benjamin Milde"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/LostKobrakai/cldr_languages"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_cldr, "~> 2.0"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:excoveralls, "~> 0.8", only: :test},
      {:jason, "~> 1.0", optional: true}
    ]
  end

  defp cli_env do
    [
      coverall: :test,
      "coveralls.detail": :test,
      "coveralls.post": :test,
      "coveralls.html": :test
    ]
  end

  defp elixirc_paths(:test), do: ~w(lib mix test)
  defp elixirc_paths(:dev), do: ~w(lib mix)
  defp elixirc_paths(_), do: ~w(lib)
end
