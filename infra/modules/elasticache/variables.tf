variable "namespace" {
  description = "Default namespace"
  type        = string
}
variable "description" {
  description = "description"
  type        = string
  default     = "Redis Cluster Replication Group"
}
variable "cluster_id" {
  description = "Id to assign the new cluster"
  type        = string
}
variable "parameter_group_name" {
  description = "Name of the parameter group to associate with this replication group. If this argument is omitted, the default cache parameter group for the specified engine is used. To enable cluster mode, i.e., data sharding, use a parameter group that has the parameter cluster-enabled set to true"
  type        = string
  default     = null
}
variable "subnet_ids" {
  description = "Id to assign the new cluster"
  type        = list(string)
}
variable "vpc_id" {
  description = "Id to assign the new cluster"
  type        = string
}
variable "node_type" {
  description = "Instance class to be used. See AWS documentation for information on supported node types and guidance on selecting node types. Required unless global_replication_group_id is set. Cannot be set if global_replication_group_id is set"
  type        = string
}
variable "num_cache_clusters" {
  description = "Number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2. Updates will occur before other modifications. Conflicts with num_node_groups. Defaults to 1"
  type        = number
  default     = 1
}
variable "snapshot_retention_limit" {
  description = "Redis only) Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of snapshot_retention_limit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro cache nodes"
  type        = number
  default     = 5
}
variable "snapshot_window" {
  description = "Id to assign the new cluster"
  type        = string
  default     = "00:00-05:00"
}
variable "automatic_failover_enabled" {
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, num_cache_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false"
  default     = false
  type        = bool
}