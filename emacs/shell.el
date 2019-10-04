(setq explicit-shell-file-name "wsl.exe -d Debian")
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
