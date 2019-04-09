'https://p0w3rsh3ll.wordpress.com/2014/01/02/list-the-windows-service-hardening-firewall-rules/

'This VBScript adds a port range from 9000 to 9999 for outgoing traffic
'run as cscript addportrange.vbs on the hyper-v host

option explicit

Dim InterfaceArray
Dim LowerBound
Dim UpperBound
Dim iterate
Dim rule

'Protocol
Const NET_FW_IP_PROTOCOL_TCP = 6
Const NET_FW_IP_PROTOCOL_UDP = 17
Const NET_FW_IP_PROTOCOL_ICMPv4 = 1
Const NET_FW_IP_PROTOCOL_ICMPv6 = 58

'Action
const NET_FW_ACTION_BLOCK = 0
const NET_FW_ACTION_ALLOW = 1

'Direction
const NET_FW_RULE_DIR_IN = 1
const NET_FW_RULE_DIR_OUT = 2

' Profile Type
Const NET_FW_PROFILE2_DOMAIN = 1
Const NET_FW_PROFILE2_PRIVATE = 2
Const NET_FW_PROFILE2_PUBLIC = 4

'Create the FwPolicy2 object.
Dim fwPolicy2
Set fwPolicy2 = CreateObject("HNetCfg.FwPolicy2")

'Get the Service Restriction object for the local firewall policy.
Dim ServiceRestriction
Set ServiceRestriction = fwPolicy2.ServiceRestriction

WScript.Echo( "HNetCfg.fwPolicy2.ServiceRestriction" )

'If the service requires sending/receiving certain type of traffic, then add "allow" WSH rules as follows
'Get the collection of Windows Service Hardening networking rules

Dim Rulesobject
Set Rulesobject = ServiceRestriction.Rules

WScript.Echo( " Service Rules Count : " & Rulesobject.count )
'WScript.Quit(0)

For Each rule In Rulesobject
        
        WScript.Echo("  Profile:          " & rule.Profiles)


    'if rule.Profiles And CurrentProfiles then
        WScript.Echo("  Rule Name:          " & rule.Name)
        WScript.Echo("   ----------------------------------------------")
        WScript.Echo("  Description:        " & rule.Description)
        WScript.Echo("  Application Name:   " & rule.ApplicationName)
        WScript.Echo("  Service Name:       " & rule.ServiceName)
        Select Case rule.Protocol
            Case NET_FW_IP_PROTOCOL_TCP    WScript.Echo("  IP Protocol:        TCP.")
            Case NET_FW_IP_PROTOCOL_UDP    WScript.Echo("  IP Protocol:        UDP.")
            Case NET_FW_IP_PROTOCOL_ICMPv4 WScript.Echo("  IP Protocol:        UDP.")
            Case NET_FW_IP_PROTOCOL_ICMPv6 WScript.Echo("  IP Protocol:        UDP.")
            Case Else                      WScript.Echo("  IP Protocol:        " & rule.Protocol)
        End Select
        if rule.Protocol = NET_FW_IP_PROTOCOL_TCP or rule.Protocol = NET_FW_IP_PROTOCOL_UDP then
            WScript.Echo("  Local Ports:        " & rule.LocalPorts)
            WScript.Echo("  Remote Ports:       " & rule.RemotePorts)
            WScript.Echo("  LocalAddresses:     " & rule.LocalAddresses)
            WScript.Echo("  RemoteAddresses:    " & rule.RemoteAddresses)
        end if
        if rule.Protocol = NET_FW_IP_PROTOCOL_ICMPv4 or rule.Protocol = NET_FW_IP_PROTOCOL_ICMPv6 then
            WScript.Echo("  ICMP Type and Code:    " & rule.IcmpTypesAndCodes)
        end if
        Select Case rule.Direction
            Case NET_FW_RULE_DIR_IN  WScript.Echo("  Direction:          In")
            Case NET_FW_RULE_DIR_OUT WScript.Echo("  Direction:          Out")
        End Select
        WScript.Echo("  Enabled:            " & rule.Enabled)
        WScript.Echo("  Edge:               " & rule.EdgeTraversal)
        Select Case rule.Action
            Case NET_FW_ACTION_ALLOW  WScript.Echo("  Action:             Allow")
            Case NET_FW_ACTION_BLOCk  WScript.Echo("  Action:             Block")
        End Select
        WScript.Echo("  Grouping:           " & rule.Grouping)
        WScript.Echo("  Edge:               " & rule.EdgeTraversal)
        WScript.Echo("  Interface Types:    " & rule.InterfaceTypes)
        InterfaceArray = rule.Interfaces
        if IsEmpty(InterfaceArray) then
            WScript.Echo("  Interfaces:         All")
        else
            LowerBound = LBound(InterfaceArray)
            UpperBound = UBound(InterfaceArray)
            WScript.Echo("  Interfaces:     ")
            for iterate = LowerBound To UpperBound
                WScript.Echo("       " & InterfaceArray(iterate))
            Next
        end if

        WScript.Echo("")
    'end if
Next

'end of script
