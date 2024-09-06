api_addr = "http://localhost:8200"
cluster_addr = "http://127.0.0.1:8201"
cluster_name = "vault-raft-cluster"

ui = true

#mlock = true
disable_mlock = true

storage "raft" {
  path    = "/vault/data"
  node_id = "vault-raft"
}

# HTTP listener
#listener "tcp" {
#  address = "127.0.0.1:8200"
#  tls_disable = 1
#}

# HTTPS listener
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/opt/vault/tls/tls.crt"
  tls_key_file  = "/opt/vault/tls/tls.key"
}

#seal "gcpckms" {
#  credentials = "$GCP_SA_KEY_PATH"
#  project     = "$GCP_PROJECT_ID"
#  region      = "$GCP_REGION"
#  key_ring    = "$GCP_KMS_KEY_RING"
#  crypto_key  = "$GCP_KMS_KEY"
#}

seal "gcpckms" {
  credentials = "/usr/vault/vault-project-user-creds.json"
  project     = "hybrid-task-425312-v4"
  region      = "europe-west3"
  key_ring    = "vault-raft-ckms"
  crypto_key  = "vault-raft-key"
}
