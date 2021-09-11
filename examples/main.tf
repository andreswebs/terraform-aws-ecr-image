module "ecr_image" {
  source        = "github.com/andreswebs/terraform-aws-ecr-image"
  ecr_namespace = "yourorg"
  image_suffix  = "yourimage"
  source_path   = "./src-example"
}