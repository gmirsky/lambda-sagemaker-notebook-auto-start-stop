resource "aws_iam_policy" "policy" {
  name        = "control-policy"
  description = "A policy to control SageMaker instances start/stop state"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "CloudWatchLogs0",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/*NotebookInstance:*"
        },
        {
            "Sid": "InstanceControl",
            "Effect": "Allow",
            "Action": [
                "sagemaker:ListTags",
                "ec2:ModifyNetworkInterfaceAttribute",
                "sagemaker:DescribeNotebookInstance",
                "ec2:DeleteNetworkInterface",
                "ec2:DescribeSecurityGroups",
                "ec2:CreateNetworkInterface",
                "ec2:DescribeInternetGateways",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeAvailabilityZones",
                "sagemaker:StopNotebookInstance",
                "ec2:DescribeVpcs",
                "sagemaker:StartNotebookInstance",
                "ec2:AttachNetworkInterface",
                "ec2:DescribeSubnets",
                "sagemaker:ListNotebookInstances"
            ],
            "Resource": "*"
        },
        {
            "Sid": "CloudWatchLogs1",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:*"
        }
    ]
}
EOF
}
