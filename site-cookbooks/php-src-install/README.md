php-src-install Cookbook
========================
PHP をソースからインストールするクックブックです。

Requirements
------------

Attributes
----------

Usage
-----
#### php-src-install::default

e.g.
Just include `php-src-install` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[php-src-install]"
  ]
}
```

Contributing
------------

License and Authors
-------------------
