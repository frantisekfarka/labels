# Synopsis

Latex template for generating labels from a csv (and initially a spreadsheet) file

## How to run

Just use the ``generate.sh`` with a template and an input file:

```bash
./generate.sh [skull|ethanol] src/sample.csv
```

The generated file can than be found in `out/sample.pdf`.

## Templates

Available templates:

* __skull__ in `skull.tex`, small labels intended for skull samples
* __ethanol__ in `ethanol.tex`, big labels for samples in ethanol

## Input format

Data are prepared in *e.g.* a spreadsheet and exported into csv (semicolon
separated; no field delimiters); columns in the spreadsheet are:


Column          | Note
--------------- | ----
genus           |
species         |
location        |
date            | preferably in format D. M. YYYY
*empty*         | originally no. field without a prefix
no. collection  | automatically prefixed by *NMP6V*
*empty*         | type of sample, not rendered
legit           |
sex             | format `2mm + 3ff`; m's and f's are automatically replaced
described       |
state           |
no. field       | expected including a prefix (*e.g.* 'ff1234')
type/paratype   |


Additional columns are ignored. 

## Advanced Configuration

The `generate.sh` script can be overridden such that the output is *e.g.*
uploaded to a remote server by providing an overriding file `.config`:

```bash
CP=scp
DEST_PATH=example.com:/home/labels/
```



