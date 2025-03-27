#!/bin/bash
# This script is for AWS resources usage.
# Version:- V1
# AWS (EC2, S3, Lambda, IAM Users)
# To run the script in debug mode
set -x
# List S3 buckets
echo "Print List Of S3 Buckets:"
aws s3 ls > resourcetracker.txt
# List EC2 Instance
echo "Print List Of EC2 Instances:"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceID' >> resourcetracker.txt
# 'aws ec2 describe-instances' will provide list of Information in Jason format including Instance ID. 
# To retrive only the Instance ID it will come under the jason format /Reservations[]/Instances[]/InstanceID[] 
# List Lambda
echo "Print List Of Lambda:" 
aws lambda list-functions >> resourcetracker.txt
#List IAM users
echo "Print List Of IAM users:" 
aws iam list-users >> resourcetracker.txt



