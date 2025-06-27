# 🧪 Xapic Group1 Week 7 DevOps Project: Automate Lambda Layer Management with GitHub Actions & Terraform

## 📌 Overview

This project demonstrates how to modularize AWS Lambda functions using *Lambda Layers, and how to automate the packaging, deployment, and infrastructure provisioning using **GitHub Actions* and *Terraform*.

By the end of this project:
- You'll have a Lambda Layer for reusable code.
- A Lambda Function that uses the Layer.
- An automated CI/CD pipeline that deploys everything to AWS.

---

## 🛠 Lambda Function

*File:* lambda_functions/handler.py

```python
from my_utils.helper import add_numbers

def lambda_handler(event, context):
    result = add_numbers(3, 4)
    return {
        "statusCode": 200,
        "body": f"The sum is {result}"
    }

This function imports logic from the layer, demonstrating separation of concerns.


---

🧩 Lambda Layer (Shared Code)

File: layers/my_utils/helper.py

def add_numbers(a, b):
    return a + b

This utility can be reused across many Lambda functions. You can expand this to include more tools or external libraries.


---

🧱 Infrastructure as Code (Terraform)

File: ./main.tf

Creates:

Lambda Layer

Lambda Function

IAM Execution Role

Attaches the layer to the function



File: Terraform/variables.tf

Declares reusable parameters like function names, region, etc.

File: Terraform/outputs.tf

Gives feedback after deployment:

output "lambda_function_arn" {
  value = aws_lambda_function.my_lambda.arn
}


---

🔁 Continuous Deployment (GitHub Actions)

File: .github/workflows/deploy.yml

This CI/CD pipeline is triggered when you push updates to the repo.

CI Steps:

1. ✅ Zip the layers/my_utils directory into my_utils.zip


2. ✅ Zip the lambda_functions/ into lambda_function.zip


3. ✅ Run terraform apply to deploy to AWS



Secrets Required:

In your GitHub repository:

Go to: Settings → Secrets and Variables → Actions

Add:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY




---

🚀 How to Deploy

1. Push to GitHub

git add .
git commit -m "Initial Lambda + Layer setup"
git push origin main

2. GitHub Actions Will:

Zip both your layer and Lambda

Run Terraform

Deploy everything to AWS



---

✅ How to Test the Lambda

Option 1: AWS Console

Go to Lambda Console → Select your function

Click Test

Use event: {}


Option 2: AWS CLI

aws lambda invoke \
  --function-name aws-lambda-layer \
  --payload '{}' \
  output.json
cat output.json

Expected Output:

{
  "statusCode": 200,
  "body": "The sum is 7"
}


---

🔍 Benefits of Using Lambda Layers

Feature	Benefit

♻ Reusability	Share utility code across multiple Lambda functions
📦 Smaller Packages	Function packages are smaller and cleaner
📚 Versioning	Layers support version control for safer updates
⚡ Faster CI/CD	You don't need to re-upload libraries every time you deploy
👥 Team Collaboration	Standardize logic (e.g., error handling, logging) across functions



---

📓 Example Outputs (From terraform apply)

Outputs:

lambda_function_arn = "arn:aws:lambda:us-east-1:123456789012:function:lambda-with-layer"
lambda_layer_arn    = "arn:aws:lambda:us-east-1:123456789012:layer:my-utils-layer:1"
lambda_layer_version = 1
lambda_role_arn     = "arn:aws:iam::123456789012:role/lambda_exec_role"


---

📌 Final Thoughts

This project showcases how you can:

Keep your Lambda code modular with Layers

Provision infrastructure safely with Terraform

Automate builds and deployment using GitHub Actions


🔐 Secrets are secured in GitHub
📦 Packages are zipped and versioned
🚀 Functions are tested and deployed cleanly


---
