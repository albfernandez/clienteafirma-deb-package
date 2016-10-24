#
# Regular cron jobs for the autofirma package
#
0 4	* * *	root	[ -x /usr/bin/autofirma_maintenance ] && /usr/bin/autofirma_maintenance
