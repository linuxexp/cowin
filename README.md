#Read me

This is suppose to work only for Mac OS, has not been customized for other platforms.

## Setup
- Requirements
	- bash
	- python3
	- cron
	- xcode command line tools

- git clone/download on desktop i.e `~/Desktop/cowin`
- add crontab entry i.e
```
$ crontab -e
* * * * * ~/Desktop/cowin/cowin.sh > ~/Desktop/cowin/cowin.log
```

This will run the script every minute & log the run in cowin.log for debug purpose.


#### Full disk access

Writting `cowin.log` requires disk access, you can give `cron` `full disk access`. If you need to know where is cron binary try.

```
$ whereis cron
```

It's usually in `/usr/sbin/cron`.


### Debug
```
$ tail -f ~/Desktop/cowin/cowin.log
```

You shoud be some entry in cowin.log if the script is triggered by cron. If there is some miss configuration then check.

```
$ cat /var/mail/$USER
```

