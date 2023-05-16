variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "chukku_db"
}

variable "replicate_source_db" {
  type        = string
  description = "The source db of read replica instance"
  default     = "chukku_replicadb"
}

variable "engine_version" {
  type        = string
  description = "The postgres engine version"
  default     = "14.6-R1"
}

variable "instance_class" {
  type        = string
  description = "The instance type of the RDS instance"
  default     = "db.m5d.xlarge"
}

variable "username" {
  type        = string
  description = "Username for the master DB user"
  default     = "postgres"
}

variable "port" {
  type        = string
  description = "The port on which the DB accepts connections"
  default     = "5432"
}

variable "allocated_storage" {
  type        = string
  description = "The allocated storage in gigabytes. For read replica, set the same value as master's"
  default     = "400"
}

variable "max_allocated_storage" {
  type        = string
  description = "The upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Set this value to be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  default     = "0"
}

variable "storage_type" {
  type        = string
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
  default     = "gp2"
}

variable "parameter_group_name" {
  type        = string
  description = "Name of the DB parameter group to associate"
  default     = "postgres14"
}

variable "skip_final_snapshot" {
  type        = string
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  default     = "false"
}
