# Auto label your GKE VMs

Automatically scan for instances and apply billing labels.  

# Why

Currently, you must label all instances to have them shown in the GCP billing section.  With autoscaling instance groups or GKE this is impractical or difficult: VM instances come and go.  After you run this script you can do a group by based on your labels. 

<img src='https://i.imgur.com/KxnXtja.png'>
<br>
<img src='https://i.imgur.com/mPuazks.png'>

# How 

This script uses a simple config file and a regex to find machines and label them.  Once it is setup you can use it to also identify machines that are unlabeled. 

# When

The script should be ran in a cronjob.  It uses 50 threads and handles 1000k vms under 30 seconds. 

