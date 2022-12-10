module Config 
MAP = { 
        'gke-ml-machines-dev-default-pool' => ['rs-type' => 'gke',  'rs-dept'=>'ml', 'rs-project' => 'gke-omnitest-m1'],
	'gke-m2-machines-dev-default-pool' => ['rs-type' => 'gke',  'rs-dept'=>'ml', 'rs-project' => 'gke-omnitest-m2'],
        'jenkins-main' => ['rs-type' => 'vms',  'rs-dept'=>'backend', 'rs-project' => 'misc'],
        'jenkins-ml' => ['rs-type' => 'vms',  'rs-dept'=>'backend', 'rs-project' => 'misc'],
        'gke-us-east1-main-app' => ['rs-type' => 'gke',  'rs-dept'=>'backend', 'rs-project' => 'production-app'],
}
end
