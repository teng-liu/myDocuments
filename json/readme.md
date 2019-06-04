### json inside grammar

~~~
change log:
tami: 2019.June.04
~~~

#### variables

type | chars |
-----|-------|--
start   |   $[ 
end     |   ]
seprater|  ::
formate |   $[variableName::componentType::placeholder]
placeholder | normal text
ph_DB_code | VVV:dbTableName:name_key

~~~json
$[contract-title::textinput::Type Here]

$[contract-type::singleselection::VVV:codetable:contract_type]

$[contract-type::dropdownbox::VVV:codetable:province]
~~~
