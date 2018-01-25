# cryptonator

REST binding to the [Cryptonator API](https://www.cryptonator.com/api/) in Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  cryptonator:
    github: z64/cryptonator
```

## Usage

```crystal
require "cryptonator"

Cryptonator.currencies
Cryptonator.ticker("BTC", "USD")
Cryptonator.ticker_with_markets("BTC", "USD")
```

## Contributors

- [z64](https://github.com/z64) Zac Nowicki - creator, maintainer
