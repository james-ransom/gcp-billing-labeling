# Auto label your GKE VMs

Automatically scan for instances and apply billing labels based on RegEx.

# Why

You might be a legacy system without labels setup, or may want to break down GKE into specific billing labels. 

<img src='https://i.imgur.com/KxnXtja.png'>
<br>
<img src='https://i.imgur.com/OIRKK1X.png'>

# How 

This script uses a simple config file and a regex to find machines and label them.  Once it is setup you can use it to also identify machines that are unlabeled. 

# When

The script should be ran in a cronjob.  It uses 50 threads and handles 1000k vms under 30 seconds. 

