{
  outputs = {nixpkgs, ...}: {
    devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux;
      mkShell {
        name = "alejandra";
        packages = [
          gnumake
          python3
          qemu
          libguestfs-with-appliance
        ];
      };
  };
}
