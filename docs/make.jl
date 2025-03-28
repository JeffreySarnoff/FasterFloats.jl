using FasterFloats
using Documenter

DocMeta.setdocmeta!(FasterFloats, :DocTestSetup, :(using FasterFloats); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
const numbered_pages = [
    file for file in readdir(joinpath(@__DIR__, "src")) if
    file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [FasterFloats],
    authors = "Jeffrey Sarnoff <jeffrey.sarnoff@gmail.com>",
    repo = "https://github.com/JeffreySarnoff/FasterFloats.jl/blob/{commit}{path}#{line}",
    sitename = "FasterFloats.jl",
    format = Documenter.HTML(; canonical = "https://JeffreySarnoff.github.io/FasterFloats.jl"),
    pages = ["index.md"; numbered_pages],
)

deploydocs(; repo = "github.com/JeffreySarnoff/FasterFloats.jl")
