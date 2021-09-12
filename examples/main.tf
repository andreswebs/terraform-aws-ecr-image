module "ecr_image" {
  source            = "github.com/andreswebs/terraform-aws-ecr-image"
  ecr_namespace     = "yourorg"
  image_suffix      = "yourimage"
  image_source_path = "./your-image-code"
}