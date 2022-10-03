# LAMP_Stack
Repository containing Terraform for deploying a publicly available multi-region LAMP stack through GitLab CI.

The included .gitlab-ci.yml file configures the deployment pipeline and stages future module updates for deployment.
--NOTE: For the sake of the demo I've left the terrafrom apply as a manual trigger but it can easily be modified to bypass manual intervention. 

This module can also be executed locally by setting your AWS_PROFILE environment variables.
