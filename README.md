# Auto label your GKE VMs

Automatically scan for instances and apply billing labels based on RegEx.

# Why auto label??

If you have a large infrastructure it is difficult to go through all instances and label them.  Keep these up to date is time consuming.  Using a simple regex you can ensure all your machines are labeled going forward.  You can put this script in a cronjob to autolabel all your instances. 

# Example


One of our GKE clusters have VMS in this form: 
```
gke-production-app-pool-1-ac1cda16-aheb 
gke-production-app-pool-1-bc2cda97-2hjf 
gke-production-app-pool-1-cc3cda66-bhcn 
....
```

We setup a simple match pattern: 
```
module Config
MAP = {
        'gke-production-app' => ['rs-type' => 'gke',  'rs-dept'=>'infrastructure', 'rs-project' => 'gke-production-app'],
}
end
```

We can add more regex as well: 
```
MAP = {
        'gke-production-app' => ['rs-type' => 'gke',  'rs-dept'=>'infrastructure', 'rs-project' => 'gke-production-app'],
        'gke-staging-app' => ['rs-type' => 'gke',  'rs-dept'=>'development', 'rs-project' => 'gke-staging-app'],
        'gke-email-sender-production' => ['rs-type' => 'vms',  'rs-dept'=>'backend', 'rs-project' => 'gke-email-sender-production'],
        'database-production' => ['rs-type' => 'vms',  'rs-dept'=>'backend', 'rs-project' => 'database-production'],         
}
```

# View labels in billing 

<img src='https://i.imgur.com/KxnXtja.png' width='500px'>
<br>
<img src='https://i.imgur.com/OIRKK1X.png' width='500px'>

# How 

This script uses a simple config file and a regex to find machines and label them.  Once it is setup you can use it to also identify machines that are unlabeled. 

# When

The script should be ran in a cronjob.  It uses 50 threads and handles 1000k vms under 30 seconds. 

