import json
sourceRoot = "cimgui/generator/output/"
sources = ('structs_and_enums.json','impl_definitions.json','typedefs_dict.json','definitions.json')

sourceData = {}
for name in sources:
    data = json.loads(open(sourceRoot+name,"r").read())
    sourceData[name.replace(".json","")]=data

from jinja2 import Template
t = Template(open("template_rawCimgui.pxd","r").read())

print(t.render(**sourceData))
