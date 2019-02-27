/* File : iec61850.i */
%module iec61850
%ignore ControlObjectClient_setTestMode(ControlObjectClient self);
%ignore CDA_OperBoolean(ModelNode* parent, bool isTImeActivated);
%ignore LogicalNode_hasBufferedReports(LogicalNode* node);
%ignore LogicalNode_hasUnbufferedReports(LogicalNode* node);
%ignore MmsConnection_setIsoConnectionParameters(MmsConnection self, IsoConnectionParameters* params);
%include "stdint.i"
%{
#include <iec61850_client.h>
#include <iec61850_model.h>
#include <iec61850_server.h>
#include <mms_common.h>

ModelNode* toModelNode(LogicalNode * ln)
{
    return (ModelNode*) ln;
}
ModelNode* toModelNode(DataObject * DO)
{
    return (ModelNode*) DO;
}
char* toCharP(void * v)
{
    return (char *) v;
}
DataAttribute* toDataAttribute(DataObject * DO)
{ return (DataAttribute*)DO;}
DataAttribute* toDataAttribute(ModelNode * MN)
{ return (DataAttribute*)MN;}
%}
%apply int *OUTPUT {IedClientError* error};
%apply bool *OUTPUT {bool* isDeletable};

%include "libiec61850_common_api.h"
%include "iec61850_client.h"
%include "iso_connection_parameters.h"
%include "mms_client_connection.h"
%include "iso_connection_parameters.h"
%include "iec61850_common.h"
%include "mms_value.h"
%include "mms_common.h"
%include "iec61850_model.h"
%include "iec61850_server.h"
%include "iec61850_dynamic_model.h"
%include "iec61850_cdc.h"
%include "linked_list.h"
ModelNode* toModelNode(LogicalNode *);
ModelNode* toModelNode(DataObject *);
DataAttribute* toDataAttribute(DataObject *);
DataAttribute* toDataAttribute(ModelNode *);
char* toCharP(void *);
