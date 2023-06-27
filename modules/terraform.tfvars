resource_group_name = "stepstone-rg-test"
synapse-name        = "stepstone-synapse-test"
sa-name             = "stepstonesadatalake"
sa-name-2           = "stepstonesasynapse"
location            = "UK South"
fs-name             = "stepstone-fs-test"
access_tier         = "Hot"
min_tls_version     = "TLS1_2"

container_type         = "private"
container_raw_name     = "stepstone-container-raw"
container_staging_name = "stepstone-container-staging"
container_base_name    = "stepstone-container-base"
container_curated_name = "stepstone-container-curated"

synapse_sql_pool_name     = "stepstone_sql_pool_test"
synapse_sql_pool_sku_name = "DW500c"
create_mode               = "Default"

spark_pool_name  = "sparkpool"
node_size_family = "MemoryOptimized"
node_size        = "Small"
cache_size       = 10
node_count       = 3


virtual_network_name = "stepstone-vnet-test"
nsg_name             = "stepstone-nsg"
address_space        = ["10.0.0.0/16"]
subnet_prefixes      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

app_service_plan_name = "stepstone"
app_service_name      = "app-service"

