#!/usr/bin/env python3

"""
Install Python packages:
$ pip3 install --user -U click stanza


Install models:
$ python3
>>> import stanza
>>> stanza.download("en")
>>> stanza.download("fi")
>>> stanza.download("ru")
>>> stanza.download("hr")
>>> stanza.download("de")


Run script:
$ python3 stanza_pipeline.py --language=en input.txt output.conll
"""

import sys
from pathlib import Path

import click
import stanza
from stanza.utils.conll import CoNLL


@click.command()
@click.argument("source")
@click.argument("target")
@click.option("--language")
def main(source, target, language):
    source = Path(source)
    target = Path(target)

    # https://stanfordnlp.github.io/stanza/neural_pipeline.html
    # https://stanfordnlp.github.io/stanza/depparse.html
    nlp = stanza.Pipeline(
        lang=language,
        processors="tokenize,mwt,pos,lemma,depparse",
    )

    # read text file content
    text = source.read_text()
    # process text with Stanza
    doc = nlp(text)
    # write processed document to CoNLL file
    CoNLL.write_doc2conll(doc, target)


if __name__ == "__main__":
    main()
