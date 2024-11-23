function togglePasswordVisibility(inputId, iconId) {
		var input = document.getElementById(inputId);
		var icon = document.getElementById(iconId);
		if (input.type === "password") {
			input.type = "text";
			icon.classList.remove("bi-eye-slash");
			icon.classList.add("bi-eye");
		} else {
			input.type = "password";
			icon.classList.remove("bi-eye");
			icon.classList.add("bi-eye-slash");
		}
	}