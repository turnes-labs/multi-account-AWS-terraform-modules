# Terraform modules

## Create a new module flow

```bash
MODULE_NAME=aws-name
TAG=v0.0.1
mkdir $MODULE_NAME
cd $MODULE_NAME
touch main.tf versions.tf outputs.tf variables.tf 
# add, commit and push the code

# add a tag
git tag -a modules/$MODULE_NAME/$TAG -m "Release $TAG of module $MUDULE_NAME"
git push origin modules/$MODULE_NAME/$TAG
```
