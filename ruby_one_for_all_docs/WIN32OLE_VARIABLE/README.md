# WIN32OLE_VARIABLE < Object

(from ruby core)
---
`WIN32OLE_VARIABLE` objects represent OLE variable information.
---
# Instance methods:

    inspect
    name
    ole_type
    ole_type_detail
    to_s
    value
    variable_kind
    varkind
    visible?

# WIN32OLE_VARIABLE#inspect

(from ruby core)
---
    WIN32OLE_VARIABLE#inspect -> String

---

Returns the OLE variable name and the value with class name.


# WIN32OLE_VARIABLE#name

(from ruby core)
---
    WIN32OLE_VARIABLE#name

---

Returns the name of variable.

    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'XlSheetType')
    variables = tobj.variables
    variables.each do |variable|
      puts "#{variable.name}"
    end

    The result of above script is following:
      xlChart
      xlDialogSheet
      xlExcel4IntlMacroSheet
      xlExcel4MacroSheet
      xlWorksheet


# WIN32OLE_VARIABLE#ole_type

(from ruby core)
---
    WIN32OLE_VARIABLE#ole_type

---

Returns OLE type string.

    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'XlSheetType')
    variables = tobj.variables
    variables.each do |variable|
      puts "#{variable.ole_type} #{variable.name}"
    end

    The result of above script is following:
      INT xlChart
      INT xlDialogSheet
      INT xlExcel4IntlMacroSheet
      INT xlExcel4MacroSheet
      INT xlWorksheet


# WIN32OLE_VARIABLE#ole_type_detail

(from ruby core)
---
    WIN32OLE_VARIABLE#ole_type_detail

---

Returns detail information of type. The information is array of type.

    tobj = WIN32OLE_TYPE.new('DirectX 7 for Visual Basic Type Library', 'D3DCLIPSTATUS')
    variable = tobj.variables.find {|variable| variable.name == 'lFlags'}
    tdetail  = variable.ole_type_detail
    p tdetail # => ["USERDEFINED", "CONST_D3DCLIPSTATUSFLAGS"]


# WIN32OLE_VARIABLE#to_s

(from ruby core)
---
    to_s()

---


# WIN32OLE_VARIABLE#value

(from ruby core)
---
    WIN32OLE_VARIABLE#value

---

Returns value if value is exists. If the value does not exist, this method
returns nil.

    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'XlSheetType')
    variables = tobj.variables
    variables.each do |variable|
      puts "#{variable.name} #{variable.value}"
    end

    The result of above script is following:
      xlChart = -4109
      xlDialogSheet = -4116
      xlExcel4IntlMacroSheet = 4
      xlExcel4MacroSheet = 3
      xlWorksheet = -4167


# WIN32OLE_VARIABLE#variable_kind

(from ruby core)
---
    WIN32OLE_VARIABLE#variable_kind

---

Returns variable kind string.

    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'XlSheetType')
    variables = tobj.variables
    variables.each do |variable|
      puts "#{variable.name} #{variable.variable_kind}"
    end

    The result of above script is following:
      xlChart CONSTANT
      xlDialogSheet CONSTANT
      xlExcel4IntlMacroSheet CONSTANT
      xlExcel4MacroSheet CONSTANT
      xlWorksheet CONSTANT


# WIN32OLE_VARIABLE#varkind

(from ruby core)
---
    WIN32OLE_VARIABLE#varkind

---

Returns the number which represents variable kind.
    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'XlSheetType')
    variables = tobj.variables
    variables.each do |variable|
      puts "#{variable.name} #{variable.varkind}"
    end

    The result of above script is following:
       xlChart 2
       xlDialogSheet 2
       xlExcel4IntlMacroSheet 2
       xlExcel4MacroSheet 2
       xlWorksheet 2


# WIN32OLE_VARIABLE#visible?

(from ruby core)
---
    WIN32OLE_VARIABLE#visible?

---

Returns true if the variable is public.

    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'XlSheetType')
    variables = tobj.variables
    variables.each do |variable|
      puts "#{variable.name} #{variable.visible?}"
    end

    The result of above script is following:
      xlChart true
      xlDialogSheet true
      xlExcel4IntlMacroSheet true
      xlExcel4MacroSheet true
      xlWorksheet true


