#ifndef __CDSL_RCL_DEFINITIONS_H__
#define __CDSL_RCL_DEFINITIONS_H__

// NR clients:
#define CDSL_QUEUE_RCL_NR_CLIENTS		3

// client buffer slot:
#define CDSL_QUEUEU_RCL_CLIENT_BUFFER_SLOT
#define CDSL_QUEUE_RCL_BUFFER_CLEAR		0x77777777
#define CDSL_QUEUE_RCL_DEQUEUE_REQUEST		0x12345678
#define CDSL_QUEUE_RCL_CLIENT_FINISHED		0x99999999
#define CDSL_QUEUE_RCL_EMPTY_QUEUE		0xFFFFFFFF

// NR clients:
#define CDSL_DEQUE_RCL_NR_CLIENTS		3

// client buffer slot:
#define CDSL_DEQUE_RCL_CLIENT_BUFFER_SLOT
#define CDSL_DEQUE_RCL_BUFFER_CLEAR				0x77777777
#define CDSL_DEQUE_RCL_POP_TAIL_REQUEST			0x12345678
#define CDSL_DEQUE_RCL_POP_HEAD_REQUEST			0x87654321
#define CDSL_DEQUE_RCL_CLIENT_FINISHED			0x99999999
#define CDSL_DEQUE_RCL_EMPTY_QUEUE				0xFFFFFFFF

#endif
