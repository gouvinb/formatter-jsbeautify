# formatter-jsbeautify package

Formatter for Javascript, HTML, CSS, LESS, SASS.

This Formatter plugin for [Formatter](https://atom.io/packages/formatter)
provides an interface to
[js-beautify](https://github.com/beautify-web/js-beautify).

## Installation

1.  Install js-beautify (`npm install -g js-beautify`)

2.  Install [Formatter](https://atom.io/packages/formatter) package via Atom

    -   *or with* `apm install formatter`

3.  Install formatter-jsbeautify package via Atom

    -   *or with* `apm install formatter-jsbeautify`

## Usage

### In your source compatible file

Default (inspired from IntelliJ):

```cson
'atom-text-editor':
  'alt-ctrl-l': 'formatter:format-code'
  'alt-cmd-l': 'formatter:format-code'
```

### List of config

-   Path to the exectuable node

    -   **Full path** node

-   Path to the exectuable js-beautify

    -   **Full path** js-beautify

-   Javascript language

    -   Enable formatter for Javascript language (*need restart Atom*)

    -   Arguments passed to the formatter Javascript language

        -   Example : `-s, 3, -w, 80`

-   HTML language

    -   Enable formatter for HTML language (*need restart Atom*)

    -   Arguments passed to the formatter HTML language

        -   Example : `-s, 8, -w, 160`

-   CSS language

    -   Enable formatter for CSS language (*need restart Atom*)

    -   Arguments passed to the formatter CSS language

        -   Example : `-config=/usr/local/mycfg/css/.jsbeautifyrc`

-   LESS language

    -   Enable formatter for LESS language (*need restart Atom*)

    -   Arguments passed to the formatter LESS language

        -   Example : `-config=/usr/local/mycfg/less/.jsbeautifyrc`

-   SASS language

    -   Enable formatter for SASS language (*need restart Atom*)

    -   Arguments passed to the formatter SASS language

        -   Example : `-config=/usr/local/mycfg/sass/.jsbeautifyrc`

## TODO

-   [ ] optimize enable config

-   [ ] cursor position

-   [ ] more optimization ?

    -   [ ] env node ?

## Contributing

1.  Fork it!
2.  Create your feature branch: `git checkout -b my-new-feature`
3.  Commit your changes: `git commit -am 'Add some feature'`
4.  Push to the branch: `git push origin my-new-feature`
5.  Submit a pull request :D

## License

See [LICENSE.md](./LICENSE.md)
