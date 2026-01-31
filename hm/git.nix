{
  programs.git = {
    enable = true;

    settings = {
      github.User = "GustavoPeixotoG";
      init.defaultBranch = "main";
      user = {
        email = "gustavopeixoto0000@gmail.com";
        name = "GustavoPeixotoG";
      };
    };
  };

  programs.difftastic = {
    enable = true;
    git.enable = true;
    options.display = "side-by-side-show-both";
  };
}
