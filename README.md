# dotfiles

This repo contains the configuration to setup my machines. This is using [Chezmoi](https://chezmoi.io), the dotfile manager to setup the install.

This automated setup is currently only configured for Debian (pikaOS) machines.

## How to run

### Without bitwarden

```shell
export GITHUB_USERNAME=mjcc30
export SECRETS_OFF=true
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

### With bitwarden

You need to have a bitwarden account (or selfhosted) and create an ssh secret using this command.

```sh
./utils/bw_add_ssh_key.sh
```

```sh
export GITHUB_USERNAME=mjcc30
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
