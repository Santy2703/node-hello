data "aws_iam_policy_document" "assume_by_ecr" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecr" {
  name               = "node-rolefor-ecr"
  assume_role_policy = data.aws_iam_policy_document.assume_by_ecr.json
}

resource "aws_ecr_repository" "this" {
  name  = "node-repo"
}
