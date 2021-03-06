#!/bin/bash
#
tmpdir=${WORKSPACE}/tmp
dockerTags=$(cat ${tmpdir}/dockerTags)

### Tag and Push Docker image
t=$(aws ecr get-login --region $AWS_REGION)
echo "Exit code ECR login: $?"
aws_login=${t/-e none}
aws_url="${aws_login##*https://}"
${aws_login}
echo "Exit code Docker login: $?"
for T in ${dockerTags}; do
  target=${aws_url}/${T}
  docker tag ${T} ${target}
  docker push ${target}
  echo "Exit code Docker push: $?"
done
