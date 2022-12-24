{
  inputs,
  cell,
}: {
  default = cell.packages.app;
  app = inputs.dream2nix.lib.makeOutput {
    pkgs = inputs.nixpkgs;
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
