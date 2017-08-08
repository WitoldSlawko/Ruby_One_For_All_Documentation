# WIN32OLE < Object

(from ruby core)
---
`WIN32OLE` objects represent OLE Automation object in Ruby.

By using WIN32OLE, you can access OLE server like VBScript.

Here is sample script.

    require 'win32ole'

    excel = WIN32OLE.new('Excel.Application')
    excel.visible = true
    workbook = excel.Workbooks.Add();
    worksheet = workbook.Worksheets(1);
    worksheet.Range("A1:D1").value = ["North","South","East","West"];
    worksheet.Range("A2:B2").value = [5.2, 10];
    worksheet.Range("C2").value = 8;
    worksheet.Range("D2").value = 20;

    range = worksheet.Range("A1:D2");
    range.select
    chart = workbook.Charts.Add;

    workbook.saved = true;

    excel.ActiveWorkbook.Close(0);
    excel.Quit();

Unfortunately, Win32OLE doesn't support the argument passed by reference
directly. Instead, Win32OLE provides WIN32OLE::ARGV or WIN32OLE_VARIANT
object. If you want to get the result value of argument passed by reference,
you can use WIN32OLE::ARGV or WIN32OLE_VARIANT.

    oleobj.method(arg1, arg2, refargv3)
    puts WIN32OLE::ARGV[2]   # the value of refargv3 after called oleobj.method

or

    refargv3 = WIN32OLE_VARIANT.new(XXX,
                WIN32OLE::VARIANT::VT_BYREF|WIN32OLE::VARIANT::VT_XXX)
    oleobj.method(arg1, arg2, refargv3)
    p refargv3.value # the value of refargv3 after called oleobj.method.
---
# Constants:

ARGV
:   After invoking OLE methods with reference arguments, you can access the
    value of arguments by using ARGV.

    If the method of OLE(COM) server written by C#.NET is following:

        void calcsum(int a, int b, out int c) {
            c = a + b;
        }

    then, the Ruby OLE(COM) client script to retrieve the value of argument c
    after invoking calcsum method is following:

        a = 10
        b = 20
        c = 0
        comserver.calcsum(a, b, c)
        p c # => 0
        p WIN32OLE::ARGV # => [10, 20, 30]

    You can use WIN32OLE_VARIANT object to retrieve the value of reference
    arguments instead of referring WIN32OLE::ARGV.
CP_ACP
:   ANSI code page. See WIN32OLE.codepage and WIN32OLE.codepage=.
CP_MACCP
:   2
CP_OEMCP
:   OEM code page. See WIN32OLE.codepage and WIN32OLE.codepage=.
CP_SYMBOL
:   symbol code page. See WIN32OLE.codepage and WIN32OLE.codepage=.
CP_THREAD_ACP
:   current thread ANSI code page. See WIN32OLE.codepage and
    WIN32OLE.codepage=.
CP_UTF7
:   UTF-7 code page. See WIN32OLE.codepage and WIN32OLE.codepage=.
CP_UTF8
:   UTF-8 code page. See WIN32OLE.codepage and WIN32OLE.codepage=.
LOCALE_SYSTEM_DEFAULT
:   default locale for the operating system. See WIN32OLE.locale and
    WIN32OLE.locale=.
LOCALE_USER_DEFAULT
:   default locale for the user or process. See WIN32OLE.locale and
    WIN32OLE.locale=.
VERSION
:   Version string of WIN32OLE.


# Class methods:

    codepage
    codepage=
    connect
    const_load
    create_guid
    locale
    locale=
    new
    ole_free
    ole_reference_count
    ole_show_help

# Instance methods:

    []
    []=
    _getproperty
    _invoke
    _setproperty
    each
    invoke
    method_missing
    ole_activex_initialize
    ole_free
    ole_func_methods
    ole_get_methods
    ole_method
    ole_method_help
    ole_methods
    ole_obj_help
    ole_put_methods
    ole_query_interface
    ole_respond_to?
    ole_type
    ole_typelib
    setproperty

# WIN32OLE::codepage

(from ruby core)
---
    WIN32OLE.codepage

---

Returns current codepage.
    WIN32OLE.codepage # => WIN32OLE::CP_ACP


# WIN32OLE::codepage=

(from ruby core)
---
    WIN32OLE.codepage = CP

---

Sets current codepage. The WIN32OLE.codepage is initialized according to
Encoding.default_internal. If Encoding.default_internal is nil then
WIN32OLE.codepage is initialized according to Encoding.default_external.

    WIN32OLE.codepage = WIN32OLE::CP_UTF8
    WIN32OLE.codepage = 65001


# WIN32OLE::connect

(from ruby core)
---
    WIN32OLE.connect( ole ) --> aWIN32OLE

---

Returns running OLE Automation object or WIN32OLE object from moniker. 1st
argument should be OLE program id or class id or moniker.

    WIN32OLE.connect('Excel.Application') # => WIN32OLE object which represents running Excel.


# WIN32OLE::const_load

(from ruby core)
---
    WIN32OLE.const_load( ole, mod = WIN32OLE)

---

Defines the constants of OLE Automation server as mod's constants. The first
argument is WIN32OLE object or type library name. If 2nd argument is omitted,
the default is WIN32OLE. The first letter of Ruby's constant variable name is
upper case, so constant variable name of WIN32OLE object is capitalized. For
example, the 'xlTop' constant of Excel is changed to 'XlTop' in WIN32OLE. If
the first letter of constant variable is not [A-Z], then the constant is
defined as CONSTANTS hash element.

    module EXCEL_CONST
    end
    excel = WIN32OLE.new('Excel.Application')
    WIN32OLE.const_load(excel, EXCEL_CONST)
    puts EXCEL_CONST::XlTop # => -4160
    puts EXCEL_CONST::CONSTANTS['_xlDialogChartSourceData'] # => 541

    WIN32OLE.const_load(excel)
    puts WIN32OLE::XlTop # => -4160

    module MSO
    end
    WIN32OLE.const_load('Microsoft Office 9.0 Object Library', MSO)
    puts MSO::MsoLineSingle # => 1


# WIN32OLE::create_guid

(from ruby core)
---
    WIN32OLE.create_guid

---

Creates GUID.
    WIN32OLE.create_guid # => {1CB530F1-F6B1-404D-BCE6-1959BF91F4A8}


# WIN32OLE::locale

(from ruby core)
---
    WIN32OLE.locale -> locale id.

---

Returns current locale id (lcid). The default locale is
WIN32OLE::LOCALE_SYSTEM_DEFAULT.

    lcid = WIN32OLE.locale


# WIN32OLE::locale=

(from ruby core)
---
    WIN32OLE.locale = lcid

---

Sets current locale id (lcid).

    WIN32OLE.locale = 1033 # set locale English(U.S)
    obj = WIN32OLE_VARIANT.new("$100,000", WIN32OLE::VARIANT::VT_CY)


# WIN32OLE::new

(from ruby core)
---
    WIN32OLE.new(server, [host]) -> WIN32OLE object

---

Returns a new WIN32OLE object(OLE Automation object). The first argument
server specifies OLE Automation server. The first argument should be CLSID or
PROGID. If second argument host specified, then returns OLE Automation object
on host.

    WIN32OLE.new('Excel.Application') # => Excel OLE Automation WIN32OLE object.
    WIN32OLE.new('{00024500-0000-0000-C000-000000000046}') # => Excel OLE Automation WIN32OLE object.


# WIN32OLE::ole_free

(from ruby core)
---
    WIN32OLE.ole_free(aWIN32OLE) --> number

---

Invokes Release method of Dispatch interface of WIN32OLE object. You should
not use this method because this method exists only for debugging WIN32OLE.
The return value is reference counter of OLE object.


# WIN32OLE::ole_reference_count

(from ruby core)
---
    WIN32OLE.ole_reference_count(aWIN32OLE) --> number

---

Returns reference counter of Dispatch interface of WIN32OLE object. You should
not use this method because this method exists only for debugging WIN32OLE.


# WIN32OLE::ole_show_help

(from ruby core)
---
    WIN32OLE.ole_show_help(obj [,helpcontext])

---

Displays helpfile. The 1st argument specifies WIN32OLE_TYPE object or
WIN32OLE_METHOD object or helpfile.

    excel = WIN32OLE.new('Excel.Application')
    typeobj = excel.ole_type
    WIN32OLE.ole_show_help(typeobj)


# WIN32OLE#[]

(from ruby core)
---
    WIN32OLE[a1,a2,...]

---

Returns the value of Collection specified by a1, a2,....

    dict = WIN32OLE.new('Scripting.Dictionary')
    dict.add('ruby', 'Ruby')
    puts dict['ruby'] # => 'Ruby' (same as `puts dict.item('ruby')')

Remark: You can not use this method to get the property.
    excel = WIN32OLE.new('Excel.Application')
    # puts excel['Visible']  This is error !!!
    puts excel.Visible # You should to use this style to get the property.


# WIN32OLE#[]=

(from ruby core)
---
    WIN32OLE[a1, a2, ...]=val

---

Sets the value to WIN32OLE object specified by a1, a2, ...

    dict = WIN32OLE.new('Scripting.Dictionary')
    dict.add('ruby', 'RUBY')
    dict['ruby'] = 'Ruby'
    puts dict['ruby'] # => 'Ruby'

Remark: You can not use this method to set the property value.

    excel = WIN32OLE.new('Excel.Application')
    # excel['Visible'] = true # This is error !!!
    excel.Visible = true # You should to use this style to set the property.


# WIN32OLE#_getproperty

(from ruby core)
---
    WIN32OLE#_getproperty(dispid, args, types)

---

Runs the early binding method to get property. The 1st argument specifies
dispatch ID, the 2nd argument specifies the array of arguments, the 3rd
argument specifies the array of the type of arguments.

    excel = WIN32OLE.new('Excel.Application')
    puts excel._getproperty(558, [], []) # same effect as puts excel.visible


# WIN32OLE#_invoke

(from ruby core)
---
    WIN32OLE#_invoke(dispid, args, types)

---

Runs the early binding method. The 1st argument specifies dispatch ID, the 2nd
argument specifies the array of arguments, the 3rd argument specifies the
array of the type of arguments.

    excel = WIN32OLE.new('Excel.Application')
    excel._invoke(302, [], []) #  same effect as excel.Quit


# WIN32OLE#_setproperty

(from ruby core)
---
    WIN32OLE#_setproperty(dispid, args, types)

---

Runs the early binding method to set property. The 1st argument specifies
dispatch ID, the 2nd argument specifies the array of arguments, the 3rd
argument specifies the array of the type of arguments.

    excel = WIN32OLE.new('Excel.Application')
    excel._setproperty(558, [true], [WIN32OLE::VARIANT::VT_BOOL]) # same effect as excel.visible = true


# WIN32OLE#each

(from ruby core)
---
    WIN32OLE#each {|i|...}

---

Iterates over each item of OLE collection which has IEnumVARIANT interface.

    excel = WIN32OLE.new('Excel.Application')
    book = excel.workbooks.add
    sheets = book.worksheets(1)
    cells = sheets.cells("A1:A5")
    cells.each do |cell|
      cell.value = 10
    end


# WIN32OLE#invoke

(from ruby core)
---
    WIN32OLE#invoke(method, [arg1,...])  => return value of method.

---

Runs OLE method. The first argument specifies the method name of OLE
Automation object. The others specify argument of the *method*. If you can not
execute *method* directly, then use this method instead.

    excel = WIN32OLE.new('Excel.Application')
    excel.invoke('Quit')  # => same as excel.Quit


# WIN32OLE#method_missing

(from ruby core)
---
    WIN32OLE#method_missing(id [,arg1, arg2, ...])

---

Calls WIN32OLE#invoke method.


# WIN32OLE#ole_activex_initialize

(from ruby core)
---
    WIN32OLE#ole_activex_initialize() -> Qnil

---

Initialize WIN32OLE object(ActiveX Control) by calling
IPersistMemory::InitNew.

Before calling OLE method, some kind of the ActiveX controls created with MFC
should be initialized by calling IPersistXXX::InitNew.

If and only if you received the exception "HRESULT error code: 0x8000ffff
catastrophic failure", try this method before invoking any ole_method.

    obj = WIN32OLE.new("ProgID_or_GUID_of_ActiveX_Control")
    obj.ole_activex_initialize
    obj.method(...)


# WIN32OLE#ole_free

(from ruby core)
---
    WIN32OLE#ole_free

---

invokes Release method of Dispatch interface of WIN32OLE object. Usually, you
do not need to call this method because Release method called automatically
when WIN32OLE object garbaged.


# WIN32OLE#ole_func_methods

(from ruby core)
---
    WIN32OLE#ole_func_methods

---

Returns the array of WIN32OLE_METHOD object . The element of the array is
property (settable) of WIN32OLE object.

    excel = WIN32OLE.new('Excel.Application')
    properties = excel.ole_func_methods


# WIN32OLE#ole_get_methods

(from ruby core)
---
    WIN32OLE#ole_get_methods

---

Returns the array of WIN32OLE_METHOD object . The element of the array is
property (gettable) of WIN32OLE object.

    excel = WIN32OLE.new('Excel.Application')
    properties = excel.ole_get_methods


# WIN32OLE#ole_method

(from ruby core)
---
    WIN32OLE#ole_method_help(method)

---

Returns WIN32OLE_METHOD object corresponding with method specified by 1st
argument.

    excel = WIN32OLE.new('Excel.Application')
    method = excel.ole_method_help('Quit')


# WIN32OLE#ole_method_help

(from ruby core)
---
    ole_method_help(p1)

---


# WIN32OLE#ole_methods

(from ruby core)
---
    WIN32OLE#ole_methods

---

Returns the array of WIN32OLE_METHOD object. The element is OLE method of
WIN32OLE object.

    excel = WIN32OLE.new('Excel.Application')
    methods = excel.ole_methods


# WIN32OLE#ole_obj_help

(from ruby core)
---
    ole_obj_help()

---


# WIN32OLE#ole_put_methods

(from ruby core)
---
    WIN32OLE#ole_put_methods

---

Returns the array of WIN32OLE_METHOD object . The element of the array is
property (settable) of WIN32OLE object.

    excel = WIN32OLE.new('Excel.Application')
    properties = excel.ole_put_methods


# WIN32OLE#ole_query_interface

(from ruby core)
---
    WIN32OLE#ole_query_interface(iid) -> WIN32OLE object

---

Returns WIN32OLE object for a specific dispatch or dual interface specified by
iid.

    ie = WIN32OLE.new('InternetExplorer.Application')
    ie_web_app = ie.ole_query_interface('{0002DF05-0000-0000-C000-000000000046}') # => WIN32OLE object for dispinterface IWebBrowserApp


# WIN32OLE#ole_respond_to?

(from ruby core)
---
    WIN32OLE#ole_respond_to?(method) -> true or false

---

Returns true when OLE object has OLE method, otherwise returns false.

    ie = WIN32OLE.new('InternetExplorer.Application')
    ie.ole_respond_to?("gohome") => true


# WIN32OLE#ole_type

(from ruby core)
---
    WIN32OLE#ole_type

---

Returns WIN32OLE_TYPE object.

    excel = WIN32OLE.new('Excel.Application')
    tobj = excel.ole_type


# WIN32OLE#ole_typelib

(from ruby core)
---
    WIN32OLE#ole_typelib -> The WIN32OLE_TYPELIB object

---

Returns the WIN32OLE_TYPELIB object. The object represents the type library
which contains the WIN32OLE object.

    excel = WIN32OLE.new('Excel.Application')
    tlib = excel.ole_typelib
    puts tlib.name  # -> 'Microsoft Excel 9.0 Object Library'


# WIN32OLE#setproperty

(from ruby core)
---
    WIN32OLE.setproperty('property', [arg1, arg2,...] val)

---

Sets property of OLE object. When you want to set property with argument, you
can use this method.

    excel = WIN32OLE.new('Excel.Application')
    excel.Visible = true
    book = excel.workbooks.add
    sheet = book.worksheets(1)
    sheet.setproperty('Cells', 1, 2, 10) # => The B1 cell value is 10.


