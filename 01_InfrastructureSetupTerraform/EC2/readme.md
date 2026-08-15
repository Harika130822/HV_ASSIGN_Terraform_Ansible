# EC2 Instance Provisioning

## Create Key Pair:

Generate an SSH key pair

```
ssh-keygen -t rsa -b 2048 -f my-key
```

Add the public key to Terraform

```
resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("my-key.pub")
}
```


