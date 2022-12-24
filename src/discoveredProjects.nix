{lib}: {
  settings,
  source,
  autoProjects,
  framework,
}: let
  l = lib // builtins;

  discoveredProjects = framework.functions.discoverers.discoverProjects {
    inherit settings;
    tree = framework.dlib.prepareSourceTree {inherit source;};
  };
in
  if autoProjects == true
  then discoveredProjects
  else let
    projectsList = l.attrValues projects;
  in
    # skip discovery and just add required attributes to project list
    l.forEach projectsList
    (proj:
      proj
      // {
        relPath = proj.relPath or "";
        translator = proj.translator or (l.head proj.translators);
        dreamLockPath =
          framework.functions.discoverers.getDreamLockPath
          proj
          (l.head projectsList);
      })
