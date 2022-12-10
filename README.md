# Auto label your GKE VMs

Automatically scan for instances and apply billing labels based on RegEx.

# Why

If you have a large infrastructure it is difficult to go through all instances and label them correctly.  Worse keeping this up to date is impossible.  Using a simple regex you can ensure all your machines are labeled going forward. 

<img src='https://i.imgur.com/KxnXtja.png' width='500px'>
<br>
<img src='https://i.imgur.com/OIRKK1X.png' width='500px'>

# How 

This script uses a simple config file and a regex to find machines and label them.  Once it is setup you can use it to also identify machines that are unlabeled. 

# When

The script should be ran in a cronjob.  It uses 50 threads and handles 1000k vms under 30 seconds. 

