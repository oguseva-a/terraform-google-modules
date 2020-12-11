### terraform-iaac-august-2020
# eks 
```
resource "google_container_cluster" "primary" {
    project = var.project_id
	name = var.cluster_name
	location = var.location
	remove_default_node_pool = true
	initial_node_count = var.initial_node_count
	master_auth {
		username = ""
		password = ""
		client_certificate_config {
		issue_client_certificate = false
			}
		}
	}
	resource "google_container_node_pool" "primary_preemptible_nodes" {
		name = "my-node-pool"
	    location = var.location
		cluster = google_container_cluster.primary.name
		node_count = var.node_count
		node_config {
			preemptible = true
			machine_type = var.machine_type
			metadata = {
			disable-legacy-endpoints = "true"
		}
		oauth_scopes = [
			"https://www.googleapis.com/auth/cloud-platform"
		]
	}
}
```
# provider
```

provider "google" {
	version = "2.20"
  credentials = file("~/.google/credentials")
  project     = "crucial-haiku-298300"
	region = "us-central1"
	zone = "us-central1-c"
}
```

# variables

```
variable "project_id" {
    default = "crucial-haiku-298300"
}

variable "cluster_name" {}
variable "initial_node_count" {}
variable "machine_type" {}
variable "node_count" {}
variable "location" {}
```
