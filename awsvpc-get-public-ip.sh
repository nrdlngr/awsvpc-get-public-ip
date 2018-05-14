#!/bin/bash
TASK_ARN=$(curl -s 169.254.170.2/v2/metadata | jq -r .TaskARN)
AWS_REGION=$(echo $TASK_ARN | cut -d ':' -f 4)
ENI_ID=$(aws ecs describe-tasks --task $TASK_ARN --region $AWS_REGION | jq -r .tasks[].attachments[].details[].value | grep eni)
PUBLIC_IP=$(aws ec2 describe-network-interfaces --network-interface-ids  $ENI_ID --region $AWS_REGION | jq -r .NetworkInterfaces[].PrivateIpAddresses[].Association.PublicIp)
echo "Public IP address is: $PUBLIC_IP"