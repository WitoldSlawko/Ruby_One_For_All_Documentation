# WIN32OLE_TYPE < Object

(from ruby core)
---
`WIN32OLE_TYPE` objects represent OLE type libarary information.
---
# Class methods:

    new
    ole_classes
    progids
    typelibs

# Instance methods:

    default_event_sources
    default_ole_types
    guid
    helpcontext
    helpfile
    helpstring
    implemented_ole_types
    inspect
    major_version
    minor_version
    name
    ole_methods
    ole_type
    ole_typelib
    progid
    source_ole_types
    src_type
    to_s
    typekind
    variables
    visible?

# WIN32OLE_TYPE::new

(from ruby core)
---
    WIN32OLE_TYPE.new(typelib, ole_class) -> WIN32OLE_TYPE object

---

Returns a new WIN32OLE_TYPE object. The first argument *typelib* specifies OLE
type library name. The second argument specifies OLE class name.

    WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Application')
        # => WIN32OLE_TYPE object of Application class of Excel.


# WIN32OLE_TYPE::ole_classes

(from ruby core)
---
    WIN32OLE_TYPE.ole_classes(typelib)

---

Returns array of WIN32OLE_TYPE objects defined by the *typelib* type library.
This method will be OBSOLETE. Use WIN32OLE_TYPELIB.new(typelib).ole_classes
instead.


# WIN32OLE_TYPE::progids

(from ruby core)
---
    WIN32OLE_TYPE.progids

---

Returns array of ProgID.


# WIN32OLE_TYPE::typelibs

(from ruby core)
---
    WIN32OLE_TYPE.typelibs

---

Returns array of type libraries. This method will be OBSOLETE. Use
WIN32OLE_TYPELIB.typelibs.collect{|t| t.name} instead.


# WIN32OLE_TYPE#default_event_sources

(from ruby core)
---
    WIN32OLE_TYPE#default_event_sources

---

Returns the array of WIN32OLE_TYPE object which is implemented by the
WIN32OLE_TYPE object and having IMPLTYPEFLAG_FSOURCE and
IMPLTYPEFLAG_FDEFAULT.
    tobj = WIN32OLE_TYPE.new('Microsoft Internet Controls', "InternetExplorer")
    p tobj.default_event_sources  # => [#<WIN32OLE_TYPE:DWebBrowserEvents2>]


# WIN32OLE_TYPE#default_ole_types

(from ruby core)
---
    WIN32OLE_TYPE#default_ole_types

---

Returns the array of WIN32OLE_TYPE object which is implemented by the
WIN32OLE_TYPE object and having IMPLTYPEFLAG_FDEFAULT.
    tobj = WIN32OLE_TYPE.new('Microsoft Internet Controls', "InternetExplorer")
    p tobj.default_ole_types
    # => [#<WIN32OLE_TYPE:IWebBrowser2>, #<WIN32OLE_TYPE:DWebBrowserEvents2>]


# WIN32OLE_TYPE#guid

(from ruby core)
---
    WIN32OLE_TYPE#guid  #=> GUID

---

Returns GUID.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.guid  # => {00024500-0000-0000-C000-000000000046}


# WIN32OLE_TYPE#helpcontext

(from ruby core)
---
    WIN32OLE_TYPE#helpcontext

---

Returns helpcontext. If helpcontext is not found, then returns nil.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    puts tobj.helpfile # => 131185


# WIN32OLE_TYPE#helpfile

(from ruby core)
---
    WIN32OLE_TYPE#helpfile

---

Returns helpfile path. If helpfile is not found, then returns nil.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    puts tobj.helpfile # => C:\...\VBAXL9.CHM


# WIN32OLE_TYPE#helpstring

(from ruby core)
---
    WIN32OLE_TYPE#helpstring #=> help string.

---

Returns help string.
    tobj = WIN32OLE_TYPE.new('Microsoft Internet Controls', 'IWebBrowser')
    puts tobj.helpstring # => Web Browser interface


# WIN32OLE_TYPE#implemented_ole_types

(from ruby core)
---
    WIN32OLE_TYPE#implemented_ole_types

---

Returns the array of WIN32OLE_TYPE object which is implemented by the
WIN32OLE_TYPE object.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    p tobj.implemented_ole_types # => [_Worksheet, DocEvents]


# WIN32OLE_TYPE#inspect

(from ruby core)
---
    WIN32OLE_TYPE#inspect -> String

---

Returns the type name with class name.

    ie = WIN32OLE.new('InternetExplorer.Application')
    ie.ole_type.inspect => #<WIN32OLE_TYPE:IWebBrowser2>


# WIN32OLE_TYPE#major_version

(from ruby core)
---
    WIN32OLE_TYPE#major_version

---

Returns major version.
    tobj = WIN32OLE_TYPE.new('Microsoft Word 10.0 Object Library', 'Documents')
    puts tobj.major_version # => 8


# WIN32OLE_TYPE#minor_version

(from ruby core)
---
    WIN32OLE_TYPE#minor_version #=> OLE minor version

---

Returns minor version.
    tobj = WIN32OLE_TYPE.new('Microsoft Word 10.0 Object Library', 'Documents')
    puts tobj.minor_version # => 2


# WIN32OLE_TYPE#name

(from ruby core)
---
    WIN32OLE_TYPE#name #=> OLE type name

---

Returns OLE type name.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.name  # => Application


# WIN32OLE_TYPE#ole_methods

(from ruby core)
---
    WIN32OLE_TYPE#ole_methods # the array of WIN32OLE_METHOD objects.

---

Returns array of WIN32OLE_METHOD objects which represent OLE method defined in
OLE type library.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    methods = tobj.ole_methods.collect{|m|
      m.name
    }
    # => ['Activate', 'Copy', 'Delete',....]


# WIN32OLE_TYPE#ole_type

(from ruby core)
---
    WIN32OLE_TYPE#ole_type #=> OLE type string.

---

returns type of OLE class.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.ole_type  # => Class


# WIN32OLE_TYPE#ole_typelib

(from ruby core)
---
    WIN32OLE_TYPE#ole_typelib

---

Returns the WIN32OLE_TYPELIB object which is including the WIN32OLE_TYPE
object. If it is not found, then returns nil.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Worksheet')
    puts tobj.ole_typelib # => 'Microsoft Excel 9.0 Object Library'


# WIN32OLE_TYPE#progid

(from ruby core)
---
    WIN32OLE_TYPE#progid  #=> ProgID

---

Returns ProgID if it exists. If not found, then returns nil.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.progid  # =>   Excel.Application.9


# WIN32OLE_TYPE#source_ole_types

(from ruby core)
---
    WIN32OLE_TYPE#source_ole_types

---

Returns the array of WIN32OLE_TYPE object which is implemented by the
WIN32OLE_TYPE object and having IMPLTYPEFLAG_FSOURCE.
    tobj = WIN32OLE_TYPE.new('Microsoft Internet Controls', "InternetExplorer")
    p tobj.source_ole_types
    # => [#<WIN32OLE_TYPE:DWebBrowserEvents2>, #<WIN32OLE_TYPE:DWebBrowserEvents>]


# WIN32OLE_TYPE#src_type

(from ruby core)
---
    WIN32OLE_TYPE#src_type #=> OLE source class

---

Returns source class when the OLE class is 'Alias'.
    tobj =  WIN32OLE_TYPE.new('Microsoft Office 9.0 Object Library', 'MsoRGBType')
    puts tobj.src_type # => I4


# WIN32OLE_TYPE#to_s

(from ruby core)
---
    to_s()

---


# WIN32OLE_TYPE#typekind

(from ruby core)
---
    WIN32OLE_TYPE#typekind #=> number of type.

---

Returns number which represents type.
    tobj = WIN32OLE_TYPE.new('Microsoft Word 10.0 Object Library', 'Documents')
    puts tobj.typekind # => 4


# WIN32OLE_TYPE#variables

(from ruby core)
---
    WIN32OLE_TYPE#variables

---

Returns array of WIN32OLE_VARIABLE objects which represent variables defined
in OLE class.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'XlSheetType')
    vars = tobj.variables
    vars.each do |v|
      puts "#{v.name} = #{v.value}"
    end

    The result of above sample script is follows:
      xlChart = -4109
      xlDialogSheet = -4116
      xlExcel4IntlMacroSheet = 4
      xlExcel4MacroSheet = 3
      xlWorksheet = -4167


# WIN32OLE_TYPE#visible?

(from ruby core)
---
    WIN32OLE_TYPE#visible?  #=> true or false

---

Returns true if the OLE class is public.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Application')
    puts tobj.visible  # => true


