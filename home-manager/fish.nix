{ lib, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -x EDITOR "micro"
    '';

    functions = {
      # https://unix.stackexchange.com/questions/68079/mount-cifs-network-drive-write-permissions-and-chown
      mountsmb = "sudo mount -v -t cifs -o username=$smb_user,password=$smb_pass,uid=$(id -u),gid=$(id -g) //192.168.1.248/$argv[1] ~/$argv[2]";
    };

    shellAliases = {
      nixrs = "sudo nixos-rebuild switch --flake ~/.config/nixos";
      nixrsu = "sudo nixos-rebuild switch --upgrade --flake ~/.config/nixos";
      nixcode = "codium ~/.config/nixos";
      nixgit = "gitui --directory ~/.config/nixos";
      nixclean = "nh clean all --ask";
      msmb = "mountsmb backups-jim .backups; mountsmb cll .cll; mountsmb media .media";
      usmb = "sudo umount ~/.backups; sudo umount ~/.cll; sudo umount ~/.media";
    };
  };
}
