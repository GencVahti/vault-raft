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
