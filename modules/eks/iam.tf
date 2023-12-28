data "aws_iam_policy" "eks" {
  name = "AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "default" {
  name = "eksClusterRole"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "eks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "eks-cluster-policy"
  }
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = data.aws_iam_policy.eks.arn
}
