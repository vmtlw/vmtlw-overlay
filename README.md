# vmtlw-overlay
 this is a personal overlay for Gentoo-like systems


How to use:

Make sure you have installed package app-eselect/eselect-repository;
Add custom repository: 
```
eselect repository add vmtlw-overlay git https://github.com/vmtlw/vmtlw-overlay.git
```

Check result by run 

```
eix-sync && eix-update && net-print/rastertospl
```
