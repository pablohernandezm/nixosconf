{ pkgs, ... }:
let
  spl_es_es = builtins.fetchurl {
    url = "https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.spl";
    sha256 = "1qvv6sp4d25p1542vk0xf6argimlss9c7yh7y8dsby2wjan3fdln";
  };

  spl_es_latin1 = builtins.fetchurl {
    url = "https://ftp.nluug.nl/pub/vim/runtime/spell/es.latin1.spl";
    sha256 = "0h8lhir0yk2zcs8rjn2xdsj2y533kdz7aramsnv0syaw1y82mhq7";
  };
in
{
  home.file = {
    ".config/nvim-gh" = {
      source = ../../../dotfiles/nvim;
      recursive = true;
      force = false;
    };

    ".config/nvim-gh/spell/es.utf-8.spl" = {
      source = spl_es_es;
      force = false;
    };

    ".config/nvim-gh/spell/es.latin1.spl" = {
      source = spl_es_latin1;
      force = false;
    };
  };

  home.packages = with pkgs; [
    # utils
    ripgrep
    tree-sitter
    fd

    # formatters
    nixfmt-rfc-style # nixfmt is the official nix formatter
    stylua
    typstyle
    pgformatter
    rustfmt

    # lsp
    lua-language-server
    nixd

    rust-analyzer
    vscode-langservers-extracted
    typescript-language-server
    tailwindcss-language-server
    svelte-language-server
    hyprls
    taplo # TOML
    tinymist # Typst
    postgres-lsp
  ];
}
