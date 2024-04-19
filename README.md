# build_own_cloud
I create a self-hosted cloud to replace Dropbox and Google Drive, FileCloud is recommended for its security, remote access to files, data control, and enterprise-level data governance features. The demonstration begins with launching a FileCloud instance on AWS, emphasizing the selection of T2 medium instance type for improved performance and the application of a license file for full authorization.
using Amazon S3 for cost-effective storage, noting its various storage tiers and cost advantages compared to increasing volume size on AWS. Instructions for configuring AWS S3 storage for FileCloud are detailed, including creating an IAM user with S3 access keys and modifying the cloud config.php file to change the storage location to Amazon S3 for seamless integration.

