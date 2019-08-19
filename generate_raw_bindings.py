import json
sourceRoot = "cimgui/generator/output/"
sources = ('structs_and_enums.json','impl_definitions.json','typedefs_dict.json','definitions.json')

sourceData = {}
for name in sources:
    data = json.loads(open(sourceRoot+name,"r").read())
    sourceData[name.replace(".json","")]=data


from jinja2 import Template
t = Template(open("template_rawCimgui.pxd","r").read())

output = (t.render(**sourceData))

#Sometimes we get a name collision between a python
#name and a C name, this simply replaces all instances
#of key with value to get around the collisions.
reserved_names = {
#    "char*(": "_char*(",
}

for key, value in reserved_names.items():
    output = output.replace(key, value)

print(output)
