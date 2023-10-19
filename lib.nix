rec {
	binaryName = drv:
		drv.meta.mainProgram 
		or drv.pname 
		or (builtins.head (builtins.splitVersion drv.name));

	mkApp = drv: {
		type = "app";
		program = "${drv}/bin/${binaryName drv}";
	};
}
