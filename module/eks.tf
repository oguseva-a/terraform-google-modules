module "cluster" {
    source                      = "../"
    cluster_name                = "my-gke-cluster"
    location                    = "us-central1"
    initial_node_count          = 1
    machine_type                = "e2-medium"
    node_count                  = 1
}