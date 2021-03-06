#!/opt/epics-R3.14.12.7/modules/ether_ip-ether_ip-2-27/bin/linux-x86_64/eipIoc
# 3.14 example startup file for a Host - * - shell-script - * -

# Load dbd, register the drvEtherIP .. commands
dbLoadDatabase("/opt/epics-R3.14.12.7/modules/ether_ip-ether_ip-2-27/dbd/eipIoc.dbd") 
eipIoc_registerRecordDeviceDriver(pdbbase)

# epicsEnvSet("EPICS_IOC_LOG_INET", "127.0.0.1")
# epicsEnvSet("EPICS_IOC_LOG_PORT", "6505")

epicsEnvSet("EPICS_CA_SERVER_PORT", "5100")
epicsEnvSet("EPICS_CAS_INTF_ADDR_LIST", "10.0.6.57")
iocLogInit

# Initialize EtherIP driver, define PLCs
EIP_buffer_limit(450)
drvEtherIP_init()
EIP_verbosity(7)
drvEtherIP_define_PLC("plc1", "10.0.28.135", 0)

dbLoadRecords("../database/RF-Booster.db", "PLC=plc1")
iocInit()

