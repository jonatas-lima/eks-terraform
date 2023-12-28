locals {
  oidc = reverse(split("/", var.oidc_issuer))[0]
}
