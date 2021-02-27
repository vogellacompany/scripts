#!/usr/bin/env python3

import sys
import yaml
from pathlib import Path
import argparse

if sys.version_info < (3, 6):
    raise RuntimeError("This package requires Python 3.6+")

parser = argparse.ArgumentParser()
parser.add_argument("input", type=Path, help="Path to the input yaml file")
parser.add_argument('-s', '--settings', type=Path,
                    help="Path to file with adoc settings to be inserted after the course title")
parser.add_argument('-o', '--output',
                    type=Path, help="Path to output directory")
args = parser.parse_args()

HEADING_PREFIX = "= "
NEWLINE = "\n"

def convert_to_adoc(build_path, path):
    with open(path, 'r') as input_stream:
        with open(build_path / (path.stem + ".adoc"), "w") as output_stream:
            print(to_adoc(yaml.safe_load(input_stream)), file=output_stream)


def to_adoc(yaml):
    output = HEADING_PREFIX + yaml["name"] + NEWLINE

    if args.settings and args.settings.exists():
        settings = open(args.settings).read() + NEWLINE
    else:
        settings = NEWLINE + NEWLINE

    output += settings
    for category in yaml["categories"]:
        output += convert_category(category)
    return output


def convert_category(category):
    output = HEADING_PREFIX + category["name"] + NEWLINE + NEWLINE
    for exercise in category["exercises"]:
        file_name = extractExerciseFileName(exercise["fileLocation"]["filePath"])
        if file_name:
            output += f"include::{file_name}.adoc[]{NEWLINE}"
    return output + NEWLINE


def extractExerciseFileName(filePath):
    filePath = Path(filePath)
    if filePath.suffix == ".html":
        return filePath.stem
    else:
        return ""


build_path = args.input.parent
if args.output:
    build_path = args.output
build_path.mkdir(exist_ok=True)

convert_to_adoc(build_path, args.input)
