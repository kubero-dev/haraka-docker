#!/usr/bin/env python3

import jinja2
import argparse
import os

argParser = argparse.ArgumentParser()
argParser.add_argument(
    "-c",
    "--haraka-config-dir",
    help="Haraka config dir",
    type=str
)
argParser.add_argument(
    "-t",
    "--haraka-config-templates-dir",
    help="Haraka templates config dir",
    type=str
)

argParser.add_argument(
    "-d",
    "--debug",
    help="Turn debug outputs on",
    default=False,
    action='store_true'
)

args = argParser.parse_args()
DEBUG = args.debug or False

templatesPath = args.haraka_config_templates_dir or "./templates"

# check if templatesPath exists
if not os.path.exists(templatesPath):
  print("Templates path does not exist: {}".format(templatesPath))
  exit(1)

harakaConfigDir = args.haraka_config_dir or "./output"

# Write input configs
inputEnv = jinja2.Environment(
  loader=jinja2.FileSystemLoader(
    searchpath = templatesPath
  )
)

for file in os.listdir(templatesPath):
  template = inputEnv.get_template(file)
  r = template.render(env=os.environ, debug=DEBUG)
  print("--------------------")
  print(os.path.join(harakaConfigDir, file))
  print(r)
  with open(os.path.join(harakaConfigDir, file), "w") as f:
    f.write(r)

