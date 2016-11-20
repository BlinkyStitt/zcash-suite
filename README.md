# Zcash-Suite

Run https://z.cash/ and Tor with just a couple commands

# Quick Setup with Docker

1. Open port 8233 on your router
2. Install Docker from https://www.docker.com/
3. Add where you want to install zcash to your dotfiles:

```bash
export ZCASH_HOME=$HOME/zcash-suite
```

3. Start zcash and everything it needs with this 3-part command:
```bash
docker pull bwstitt/zcash-suite:latest \
&& docker run \
    --rm -it \
    -e "TARGET=$ZCASH_HOME" \
    -v "$ZCASH_HOME:$ZCASH_HOME" \
    bwstitt/zcash-suite:latest \
&& $ZCASH_HOME/bin/run
```

7. Watch the logs:

    ```bash
    $ZCASH_HOME/bin/compose logs -f
    ```
8. Once the params have finished downloading and the daemon has started, using zcash-cli is easy:

    ```bash
    $ZCASH_HOME/bin/zcash-cli help
    $ZCASH_HOME/bin/zcash-cli getinfo
    $ZCASH_HOME/bin/zcash-cli getpeerinfo
    $ZCASH_HOME/bin/zcash-list-addresses
    ```
9. Back up your wallet!

    ```bash
    cp ./data/mainnet/wallet.dat /backups/somewhere/safe
    ```

IMPORTANT! The wallet encryption feature is disabled in zcashd so be careful!

10. Start mining:

    ```bash
    # to mine on all cores (this will make your computer hot)
    $ZCASH_HOME/bin/zcash-cli setgenerate true -1

    # to mine on 1 cores (this will make your computer not as hot)
    $ZCASH_HOME/bin/zcash-cli setgenerate true 1
    ```
10. Stop mining

    ```bash
    $ZCASH_HOME/bin/zcash-cli setgenerate false
    ```


# Doing more

Run commands against the container:
```bash
$ZCASH_HOME/bin/compose exec mainnet bash -l

$ZCASH_HOME/bin/compose exec mainnet free -h
$ZCASH_HOME/bin/compose exec mainnet nproc

$ZCASH_HOME/bin/zcash-cli help
$ZCASH_HOME/bin/zcash-cli getinfo
$ZCASH_HOME/bin/zcash-cli zcbenchmark solveequihash 10
$ZCASH_HOME/bin/zcash-cli zcbenchmark solveequihash 20
$ZCASH_HOME/bin/zcash-cli setgenerate true 1
```


# Developing

```bash
docker pull bwstitt/library-composable:latest \
&& docker build . -t bwstitt/zcash-suite:latest \
&& docker run \
    --rm -it \
    -e "TARGET=$ZCASH_HOME" \
    -v "$ZCASH_HOME:$ZCASH_HOME" \
    bwstitt/zcash-suite:latest \
&& $ZCASH_HOME/bin/run
```


# Todo

 * [ ] helper to customize config
 * [ ] easily switch between mainnet and testnet and regtest
 * [ ] improve documentation
 * [ ] opt-in to serving a Tor Hidden Service

```bash
grep -R "TODO:" .
```


# Authors

Donations are much appreciated!

 - Bryan Stitt <bryan at stitthappens.com>
     - Bitcoin: 17vi3UfTYNRi6RnWRbhv7nXBH66c4gVYEV
     - Zcash: t1NEaED2QeEYckpc3WGdQrn2yPV9ujwk5gr
     - Zcash: zcGWtivu6xbzE9rdKaxFHXy9TjDsu1tw76sxGp83SCVeYn8DwRYNsWfexqhuvSWvr411V3niiwWRkCcTu8Xm2hVKhkQzFB6
