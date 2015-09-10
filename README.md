# shell-dotenv

Loads environment variables from '.env' before execution of any shell comand.

Supports multiple environments via the `DOT_ENV` environment variable.

# Usage

By default the `.env` file will be used:

```
# .env file
VAR1=foo

# shell
> echo $VAR1
foo
```

If you need multiple environments you can use the `DOT_ENV` envvar. For example, if you speficy `DOT_ENV=test` the `.env.test` file will be used:

```
# .env.test file
VAR1=bar

# shell
> echo $VAR1
foo # from .env
> DOT_ENV=test echo $VAR1
bar # from .env.test
```

You should also take a look at the [caveats](##Caveats) below.

# Installation

```
git clone https://github.com/hobofan/shell-dotenv ~/.dotenv
```

## Hooks

### zsh

```
echo 'source ~/.dotenv/dotenv.zsh' >> ~/.zshrc
```

## Caveats

  - Currently only works for `zsh`
  - Environment variables stay exported after the command is executed. As a workaround a `.env.clean` with all environment variables set empty can be used, which will be sourced before execution of the actual `.env`.

  *WARNING:* This will still leave the envvars exported if you cd out of the directory.
