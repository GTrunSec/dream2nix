{
  inputs,
  cell,
}: {
  default = cell.packages.app;
  app = inputs.dream2nix.lib.makeOutput {
    inherit (inputs) nixpkgs;
    source = inputs.src;
    projects = {
      prettier = {
        name = "prettier";
        subsystem = "nodejs";
        translator = "yarn-lock";
      };
    };
  };
}
