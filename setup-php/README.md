# Setup PHP WorkFlow Action

This is a simple action to setup your PHP environment and Composer modules. 
It provides ability to enable production development for Composer and define 
a PHP version via parameters.

## Usage

After Checkout job, you can just call this action with parameters and we'll take care for you.

```yaml
- name: Setup app
  uses: ./.github/actions/setup-xtreed
  with:
    in-production: "0"
    php-version: "8.2"
```
### Parameters

|Parameter|Values|Default|
|--|--|--|
|`in-production`| `0` to development, `1` to production|`0`|
|`php-version`|any version supported by [shivammathur/setup-php](https://github.com/shivammathur/setup-php) action|`8.2`|

## PHP Dependencies

This action enable some extensions by default. They are the following:
`bcmath, curl, dom, exif, gd, iconv, imagick,
intl, libxml, mbstring, mysql, mysqli, pcntl,
pdo, pdo_mysql, pdo_sqlite, soap, sqlite, zip`
