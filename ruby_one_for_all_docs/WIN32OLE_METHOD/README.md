# WIN32OLE_METHOD < Object

(from ruby core)
---
`WIN32OLE_METHOD` objects represent OLE method information.
---
# Class methods:

    new

# Instance methods:

    dispid
    event?
    event_interface
    helpcontext
    helpfile
    helpstring
    inspect
    invkind
    invoke_kind
    name
    offset_vtbl
    params
    return_type
    return_type_detail
    return_vtype
    size_opt_params
    size_params
    to_s
    visible?

# WIN32OLE_METHOD::new

(from ruby core)
---
    WIN32OLE_METHOD.new(ole_type,  method) -> WIN32OLE_METHOD object

---

Returns a new WIN32OLE_METHOD object which represents the information about
OLE method. The first argument *ole_type* specifies WIN32OLE_TYPE object. The
second argument *method* specifies OLE method name defined OLE class which
represents WIN32OLE_TYPE object.

    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')


# WIN32OLE_METHOD#dispid

(from ruby core)
---
    WIN32OLE_METHOD#dispid

---

Returns dispatch ID.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.dispid # => 181


# WIN32OLE_METHOD#event?

(from ruby core)
---
    WIN32OLE_METHOD#event?

---

Returns true if the method is event.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE_METHOD.new(tobj, 'SheetActivate')
    puts method.event? # => true


# WIN32OLE_METHOD#event_interface

(from ruby core)
---
    WIN32OLE_METHOD#event_interface

---

Returns event interface name if the method is event.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE_METHOD.new(tobj, 'SheetActivate')
    puts method.event_interface # =>  WorkbookEvents


# WIN32OLE_METHOD#helpcontext

(from ruby core)
---
    WIN32OLE_METHOD#helpcontext

---

Returns help context.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.helpcontext # => 65717


# WIN32OLE_METHOD#helpfile

(from ruby core)
---
    WIN32OLE_METHOD#helpfile

---

Returns help file. If help file is not found, then the method returns nil.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.helpfile # => C:\...\VBAXL9.CHM


# WIN32OLE_METHOD#helpstring

(from ruby core)
---
    WIN32OLE_METHOD#helpstring

---

Returns help string of OLE method. If the help string is not found, then the
method returns nil.
    tobj = WIN32OLE_TYPE.new('Microsoft Internet Controls', 'IWebBrowser')
    method = WIN32OLE_METHOD.new(tobj, 'Navigate')
    puts method.helpstring # => Navigates to a URL or file.


# WIN32OLE_METHOD#inspect

(from ruby core)
---
    WIN32OLE_METHOD#inspect -> String

---

Returns the method name with class name.


# WIN32OLE_METHOD#invkind

(from ruby core)
---
    WIN32OLE_MTHOD#invkind

---

Returns the method invoke kind.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.invkind # => 1


# WIN32OLE_METHOD#invoke_kind

(from ruby core)
---
    WIN32OLE_METHOD#invoke_kind

---

Returns the method kind string. The string is "UNKNOWN" or "PROPERTY" or
"PROPERTY" or "PROPERTYGET" or "PROPERTYPUT" or "PROPERTYPPUTREF" or "FUNC".
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.invoke_kind # => "FUNC"


# WIN32OLE_METHOD#name

(from ruby core)
---
    name()

---

call-seq
    WIN32OLE_METHOD#name

Returns the name of the method.

    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
    puts method.name # => SaveAs


# WIN32OLE_METHOD#offset_vtbl

(from ruby core)
---
    WIN32OLE_METHOD#offset_vtbl

---

Returns the offset ov VTBL.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.offset_vtbl # => 40


# WIN32OLE_METHOD#params

(from ruby core)
---
    WIN32OLE_METHOD#params

---

returns array of WIN32OLE_PARAM object corresponding with method parameters.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
    p method.params # => [Filename, FileFormat, Password, WriteResPassword,
                          ReadOnlyRecommended, CreateBackup, AccessMode,
                          ConflictResolution, AddToMru, TextCodepage,
                          TextVisualLayout]


# WIN32OLE_METHOD#return_type

(from ruby core)
---
    WIN32OLE_METHOD#return_type

---

Returns string of return value type of method.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.return_type # => Workbook


# WIN32OLE_METHOD#return_type_detail

(from ruby core)
---
    WIN32OLE_METHOD#return_type_detail

---

Returns detail information of return value type of method. The information is
array.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    p method.return_type_detail # => ["PTR", "USERDEFINED", "Workbook"]


# WIN32OLE_METHOD#return_vtype

(from ruby core)
---
    WIN32OLE_METHOD#return_vtype

---

Returns number of return value type of method.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.return_vtype # => 26


# WIN32OLE_METHOD#size_opt_params

(from ruby core)
---
    WIN32OLE_METHOD#size_opt_params

---

Returns the size of optional parameters.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
    puts method.size_opt_params # => 4


# WIN32OLE_METHOD#size_params

(from ruby core)
---
    WIN32OLE_METHOD#size_params

---

Returns the size of arguments of the method.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
    puts method.size_params # => 11


# WIN32OLE_METHOD#to_s

(from ruby core)
---
    to_s()

---


# WIN32OLE_METHOD#visible?

(from ruby core)
---
    WIN32OLE_METHOD#visible?

---

Returns true if the method is public.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbooks')
    method = WIN32OLE_METHOD.new(tobj, 'Add')
    puts method.visible? # => true


