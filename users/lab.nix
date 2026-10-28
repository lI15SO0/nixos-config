{ pkgs, ... } :
{
  users.users.lab = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirt" "kvm" "incus-admin" ];
    packages = with pkgs; [ ];
	shell = pkgs.zsh;
  };
}


