variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "bucket_name" {
  type        = string
  description = "The bucket name"
  default     = "tp2-bucket-marc-moureau"
}

variable "tags" {
  type = object({
    Name        = string
    Environment = string
  })
  default = {
    Name        = "tp_bucket"
    Environment = "dev"
  }
}

variable "mime_types" {
  description = "Mapping of file extensions to MIME types"
  type        = map(string)
  default = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    ttf  = "font/ttf"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
    ico  = "image/x-icon"
    png  = "image/png"
    svg  = "image/svg+xml"
  }
}

variable "sync_directories" {
  type = list(object({
    local_source_directory = string
    s3_target_directory    = string
  }))
  description = "List of directories to synchronize with S3"
  default = [{
    local_source_directory = "../build"
    s3_target_directory    = ""
  }]
}
