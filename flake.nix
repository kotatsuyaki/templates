{
  description = "kotatsuyaki's collection of flake templates";
  outputs = { self }: {
    templates = {
      rust = {
        path = ./rust;
        description = "Rust template, using Naersk";
      };
      markdown = {
        path = ./markdown;
        description = "Markdown template for Pandoc and LaTeX PDF output";
      };
    };
  };
}
