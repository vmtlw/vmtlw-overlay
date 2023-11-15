# vmtlw-overlay
 this is a personal overlay for Gentoo-like systems


How to use:

Make sure you have installed package app-eselect/eselect-repository;
Add custom repository: eselect repository add vmtlw-overlay git https://github.com/vmtlw/vmtlw-overlay.git
Sync and update eix cache. Gentoo users may do eix-sync && eix-update, Calculate Linux users must do emerge --sync && eix-update.
Check result by run eix anyway package from this repo.
