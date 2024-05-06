# Init
terraform init
terraform apply

# Running in different environments
terraform (apply|plan) --var-file=env.tfvars

# Save plan out
terraform plan -out plan.tfplan

# Run plan out
terraform apply "plan.tfplan"
