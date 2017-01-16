## Synopsis

Latex template for generating labels from csv (and initialy excel) file

## How to run

Just use the ``generate.sh`` with a template and some input file:

```bash
./generate.sh [template|ethanol|labels] src/sample.csv
```

## Templates

Available templates:

* __template__ in template.tex, small labels intended for skull samples
* __ethanol__ in ethanol.tex, big labels for samples in ethanol

## Input format

Data are prepated in e.g. spreasheet and separated into csv (semicolon
separated; no filed delimiters); columns in the spreadsheet are:


Column          | Note
--------------- | ----
genus           |
species         |
location        |
date            | preferably in format D. M. YYYY
*empty*         | originally no. field without a prefix
no. collection  | automatically prefixed by *NMP6V*
prep            | type of sample
legit           |
sex             | format: 2mm + 3ff ; m's and f' are automatically replaced
described       |
state           |
no. field       | expected including a prefix (e.g. 'pb')
typus/paratypus |






