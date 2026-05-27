{ security, ... }:
{
	security.sudo.enable = true;
	security.doas = {
		enable = true;
		extraRules = [
			{
				users = [ "foxie" "root" ];
				keepEnv = false;
				noPass = true;
			}
		];
	};
}


