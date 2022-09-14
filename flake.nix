{
  description = "Generic template for any other language";

  inputs.floxpkgs.url = "git+ssh://git@github.com/flox/floxpkgs";
  inputs.capacitor.follows = "floxpkgs/capacitor";

  nixConfig.bash-prompt = "[flox] \\[\\033[38;5;172m\\]λ \\[\\033[0m\\]";

  outputs = args @ { capacitor, ... }:
    capacitor args ({ inputs, ... }: {

      config.extraPlugins = [
        (inputs.capacitor.plugins.allLocalResources { })
      ];
    });
}
