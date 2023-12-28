data "aws_iam_policy" "worker" {
  name = "AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "ecr" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

data "aws_iam_policy" "cni" {
  name = "AmazonEKS_CNI_Policy"
}

resource "aws_iam_role" "mng" {
  name = "eksMngRole"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "mng-policy"
  }
}

resource "aws_iam_role_policy_attachment" "worker" {
  role       = aws_iam_role.mng.name
  policy_arn = data.aws_iam_policy.worker.arn
}

resource "aws_iam_role_policy_attachment" "ecr" {
  role       = aws_iam_role.mng.name
  policy_arn = data.aws_iam_policy.ecr.arn
}

resource "aws_iam_role_policy_attachment" "cni" {
  role       = aws_iam_role.mng.name
  policy_arn = data.aws_iam_policy.cni.arn
}
