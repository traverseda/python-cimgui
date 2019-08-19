Trying to auto-generate bindings for cimgui using cython

cimgui should point at 

```
python3 generate_raw_bindings.py > rawCimgui.pxd
cython rawCimgui.pxd
```
