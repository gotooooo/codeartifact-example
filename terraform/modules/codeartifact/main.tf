resource "aws_codeartifact_domain" "this" {
  domain = var.domain_name
}

resource "aws_codeartifact_domain_permissions_policy" "this" {
  domain = aws_codeartifact_domain.this.domain
  policy_document = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "ContributorPolicy",
        "Action" : [
          "codeartifact:CreateRepository",
          "codeartifact:DeleteDomain",
          "codeartifact:DeleteDomainPermissionsPolicy",
          "codeartifact:DescribeDomain",
          "codeartifact:GetAuthorizationToken",
          "codeartifact:GetDomainPermissionsPolicy",
          "codeartifact:ListRepositoriesInDomain",
          "codeartifact:PutDomainPermissionsPolicy",
          "sts:GetServiceBearerToken"
        ],
        "Effect" : "Allow",
        "Resource" : "*",
        "Principal" : {
          "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      }
    ]
  })
}

resource "aws_codeartifact_repository" "this" {
  repository = var.repository_name
  domain     = aws_codeartifact_domain.this.domain
}

resource "aws_codeartifact_repository_permissions_policy" "this" {
  repository = aws_codeartifact_repository.this.repository
  domain     = aws_codeartifact_domain.this.domain
  policy_document = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "codeartifact:DescribePackageVersion",
          "codeartifact:DescribeRepository",
          "codeartifact:GetPackageVersionReadme",
          "codeartifact:GetRepositoryEndpoint",
          "codeartifact:ListPackageVersionAssets",
          "codeartifact:ListPackageVersionDependencies",
          "codeartifact:ListPackageVersions",
          "codeartifact:ListPackages",
          "codeartifact:PublishPackageVersion",
          "codeartifact:PutPackageMetadata",
          "codeartifact:ReadFromRepository"
        ],
        "Effect" : "Allow",
        "Resource" : "*",
        "Principal" : {
          "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      }
    ]
  })
}
