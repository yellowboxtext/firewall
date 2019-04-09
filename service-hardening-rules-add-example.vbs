
option explicit

'IP protocols
const NET_FW_IP_PROTOCOL_TCP = 6
const NET_FW_IP_PROTOCOL_UDP = 17

'Action
const NET_FW_ACTION_BLOCK = 0
const NET_FW_ACTION_ALLOW = 1

'Direction
const NET_FW_RULE_DIR_IN = 1
const NET_FW_RULE_DIR_OUT = 2

'Create the FwPolicy2 object.
Dim fwPolicy2
Set fwPolicy2 = CreateObject("HNetCfg.FwPolicy2")

'Get the Service Restriction object for the local firewall policy.
Dim ServiceRestriction
Set ServiceRestriction = fwPolicy2.ServiceRestriction

'If the service requires sending/receiving certain type of traffic, then add "allow" WSH rules as follows
'Get the collection of Windows Service Hardening networking rules

Dim wshRules
Set wshRules = ServiceRestriction.Rules

'Add outbound WSH allow rules
Dim Rule1
Set Rule1 = CreateObject("HNetCfg.FWRule")
Rule1.Name = "my-hardened-service allow explorer.exe out"
Rule1.ApplicationName = "c:\windows\explorer.exe"
Rule1.ServiceName = "myexplorer"
Rule1.Protocol = NET_FW_IP_PROTOCOL_TCP
'Rule1.RemotePorts = "1"
Rule1.Action = NET_FW_ACTION_ALLOW
Rule1.Direction = NET_FW_RULE_DIR_OUT
Rule1.Enabled = FALSE
wshRules.Add Rule1

'Add outbound WSH allow Rule2s
Dim Rule2
Set Rule2 = CreateObject("HNetCfg.FWRule")
Rule2.Name = "my-hardened-service allow explorer.exe in"
Rule2.ApplicationName = "c:\windows\explorer.exe"
Rule2.ServiceName = "myexplorer"
Rule2.Protocol = NET_FW_IP_PROTOCOL_TCP
'Rule2.RemotePorts = "1"
Rule2.Action = NET_FW_ACTION_ALLOW
Rule2.Direction = NET_FW_RULE_DIR_IN
Rule2.Enabled = FALSE
wshRules.Add Rule2

'end of script
