https://mxtoolbox.atlassian.net/browse/PROD-6068

mxtoolbox-report.net|com

AWS resources:
Dynamo table: mx_yaml_prod_mx_report_message
S3: mx-reports-messages-account
Param: /s3/mx-reports-messages
SQS: mxReportsMessages
Params: /sqs/mx-reports-messages-url
/sqs/mx-reports-messages-arn

Preguntas:
Parameterize?
Add Loggly?

Shared Resources:
image-builder-postfix-shared template
* InstanceRole
* InstanceProfile
* PostfixMailflowSecurityGroup

dotnet:
created new project MxReportsPostfix
AWS: s3, dynamodbv2, ssm, cloudwatch

publish it locally in linux

udpated main.cf

image-builder up

MX record for mxtoolbox-report.TLD points to postfix.mxtoolbox-report.TLD which points to ASG
done.

app now talks to dynamo

sudo dnf install mailx

233870680723

certs: cat /postfix.mxtoolbox-report.com.csr CER-CRT/postfix_mxtoolbox-report.com.crt CER-CRT/My_CA_bundle.ca-bundle > postfix_mxtoolbox-report_com_fullchain.crt

sudo aws s3 cp s3://mx-dependencies-233870680723/scripts-mxreports/postfix_mxtoolbox-report_net.key /etc/postfix/postfix_mxtoolbox-report_net.key

sudo aws s3 cp s3://mx-dependencies-233870680723/scripts-mxreports/postfix_mxtoolbox-report_net_fullchain.crt /etc/postfix/postfix_mxtoolbox-report_net_fullchain.crt

echo "Test" | mail -s "Catch-all test" something-random@mxtoolbox-report.net

we need to use the /etc/postfix/virtual
prepend "@mxtoolbox-report.net tools" to the file. (wildcards don't work)
run postmap /etc/postfix/virtual
run postfix reload




