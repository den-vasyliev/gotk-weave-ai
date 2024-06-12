sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform

curl -s https://raw.githubusercontent.com/weave-ai/weave-ai/main/install/weave-ai.sh | sudo bash
sudo chmod +x /usr/local/bin/weave-ai
sudo apt-get install htop
curl -s https://fluxcd.io/install.sh | sudo FLUX_VERSION=2.0.0 bash
sudo chmod +x /usr/local/bin/flux
git clone https://github.com/fluxcd/terraform-provider-flux

cd terraform-provider-flux/examples/github-via-pat

sed -i '/default     = ""/d' variables.tf
cat <<EOF > terraform.tfvars
github_org = "den-vasyliev"
github_repository = "fluxcd-0"
EOF

rm -rf /home/codespace/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


#read -s TF_VAR_github_token
#export TF_VAR_github_token

#alias tf=terraform
#alias k=kubectl
#source <(kubectl completion zsh)
#tf init
#tf apply