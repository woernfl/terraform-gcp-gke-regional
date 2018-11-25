# GKE initialization

A terraform module to create a managed Kubernetes cluster on GCP GKE.

## Prerequisites

- [Install Tarraform](https://www.terraform.io/intro/getting-started/install.html)
- [Create GCP authetification JSon file](https://www.terraform.io/docs/providers/google/index.html)
- [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl)
- [Install gcloud](https://cloud.google.com/sdk/downloads)

## Create GKE cluster

An example of how to use this module is available in the [examples/gke-module](examples/gke-module/) folder.
You can use the default terraform.tfvars.example file (just need to add the path to the auth file, precise the GCP project ID and remove the .example from the file name). If you prefere to use cmd arguments, that's up to you.

Initiatialize Terraform project by importing the Google Cloud provider

```bash
terraform init
```

Check the GKE cluster that will be created

```bash
terraform plan
```

Create the GKE cluster

```bash
terraform apply -auto-approve
```

If you want to manage by hand the client credential, remove the client.tf file and get Kubernetes login info by typing this cmd

```bash
gcloud container clusters get-credentials $cluster_name --region $region --project $gcp_project_id
```

## Delete GKE cluster

Delete previously created GKE cluster

```bash
terraform destroy -force
```

## Bonus

Install autocompletion for terraform:

```bash
terraform -install-autocomplete
```

Install autocompletion for kubectl:

```bash
echo "source <(kubectl completion bash)" >> ~/.bashrc
```

## Want more

You have a project? Want to discuss? Contact me at [hello@onmyown.io](hello@onmyown.io)
