data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_iam_policy" "main" {
  name = "lb-controller-policy"

  policy = file("${path.module}/iam_policy.json")
}

resource "aws_iam_role" "main" {
  name = "lb-controller-role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
          "Effect": "Allow",
          "Principal": {
              "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}"
          },
          "Action": "sts:AssumeRoleWithWebIdentity",
          "Condition": {
              "StringEquals": {
                  "oidc.eks.${var.region}.amazonaws.com/id/${local.oidc}:aud": "sts.amazonaws.com",
                  "oidc.eks.${var.region}.amazonaws.com/id/${local.oidc}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
              }
          }
      }
    ]
  }
EOF
}

resource "aws_iam_role_policy_attachment" "controller" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main.arn
}
