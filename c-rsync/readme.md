# Build

```
sudo docker build -t c-rsync .
```

# Install

```
sudo ln -s "$(pwd)/c-rsync" /usr/local/bin/
```

Add your public keys to `keys` directory. All keys inside `keys` will be
added to ~/.ssh/authorized_keys during start of the container.

# Usage

just run `c-rsync` in the directory you want to share
