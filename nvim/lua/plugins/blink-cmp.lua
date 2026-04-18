return {
  "saghen/blink.cmp",
  dependencies = {
    "dbernheisel/hex-cmp",
  },
  opts = {
    sources = {
      per_filetype = {
        elixir = { inherit_defaults = true, "hex" },
      },
      providers = {
        hex = { name = "hex", module = "hex_cmp", async = true },
      },
    },
  },
}
