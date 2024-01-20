name: Terraform Workflow

on:
  push:
    branches:
      - '*'
      - '!main'
  pull_request:
    branches:
      - main

jobs:
  terraform:
    runs-on: ubuntu-latest

      # Replace with your desired Terraform version something

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v2

    - name: Set up Terraform
      uses: hashicorp/setup-terraform@v1
      with:
        terraform_version: ${{ env.TF_VERSION }}

    - name: Configure AWS credentials
      run: |
        echo "AWS_ACCESS_KEY_ID=${{ secrets.AWS_ACCESS_KEY_ID }}" >> $GITHUB_ENV
        echo "AWS_SECRET_ACCESS_KEY=${{ secrets.AWS_SECRET_ACCESS_KEY }}" >> $GITHUB_ENV
        echo "AWS_DEFAULT_REGION=${{ secrets.AWS_DEFAULT_REGION }}" >> $GITHUB_ENV

    - name: Initialize Terraform
      run: terraform init

    - name: Format Terraform code
      run: terraform fmt -check -recursive

    - name: Terraform Plan
      run: terraform plan

    - name: Terraform Apply
      if: github.event_name == 'pull_request'
      run: terraform apply
