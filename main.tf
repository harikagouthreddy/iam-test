# -------------------------------------------------------------------------------------------------
# IAM User
# -------------------------------------------------------------------------------------------------
resource "aws_iam_user" "this" {
  count         = var.enabled ? 1 : 0
  name          = var.name
  path          = var.path
  force_destroy = true
  tags          = var.tags
}


resource "aws_iam_access_key" "this" {
  count = var.enabled ? 1 : 0
  user  = element(concat(aws_iam_user.this.*.name, [""]), 0)
}

# -------------------------------------------------------------------------------------------------
# Attach policy ARN's
# -------------------------------------------------------------------------------------------------
resource "aws_iam_user_policy_attachment" "this_arn" {
  count      = var.enabled ? length(var.attach_policy_arns) : 0
  user       = element(concat(aws_iam_user.this.*.name, [""]), 0)
  policy_arn = var.attach_policy_arns[count.index]
}
