
option explicit

' WScript.Echo ( "Start" )
' WScript.Echo ( "Service Hardening" )

Dim rule

Dim fwPolicy2
Set fwPolicy2 = CreateObject("HNetCfg.FwPolicy2")

Dim ServiceRestriction
Set ServiceRestriction = fwPolicy2.ServiceRestriction

Dim rules
Set rules = ServiceRestriction.Rules

WScript.Echo ( "Service Hardening Rules count (было) = " & rules.Count )

For Each rule In rules
       
    WScript.Echo("Service Hardening Remove rule = " & rule.name)
    rules.Remove(rule.name)

Next

WScript.Echo ( "Service Hardening Rules count (стало) = " & rules.Count )

' WScript.Echo ( "Finish" )