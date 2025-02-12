using Documenter, QuasiMonteCarlo

cp("./docs/Manifest.toml", "./docs/src/assets/Manifest.toml", force = true)
cp("./docs/Project.toml", "./docs/src/assets/Project.toml", force = true)

include("pages.jl")

makedocs(sitename = "QuasiMonteCarlo.jl",
    authors = "Chris Rackauckas",
    modules = [QuasiMonteCarlo],
    clean = true, doctest = false, linkcheck = true,
    warnonly = [:missing_docs],
    linkcheck_ignore = [
        "https://www.sciencedirect.com/science/article/pii/S0010465509003087",
        "https://artowen.su.domains/mc/qmcstuff.pdf",
    ],
    format = Documenter.HTML(assets = ["assets/favicon.ico"],
        canonical = "https://docs.sciml.ai/QuasiMonteCarlo/stable/"),
    pages = pages)

deploydocs(repo = "github.com/SciML/QuasiMonteCarlo.jl.git";
    push_preview = true)
