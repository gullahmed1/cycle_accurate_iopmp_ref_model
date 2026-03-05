/***************************************************************************
// Copyright (c) 2026 by 10xEngineers.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Author: Gull Ahmed (gull.ahmed@10xengineers.ai)
// Date: March 05, 2026
// Description:
***************************************************************************/

package ahb_lite_c_pkg;

  import config_cycle_acc_pkg::AHB_LITE_ADDR_WIDTH;
  import config_cycle_acc_pkg::AHB_LITE_DATA_WIDTH;

  // AHB REQUEST CHANNEL from interface
  typedef struct packed {
    logic [AHB_LITE_ADDR_WIDTH-1:0] haddr;      // 4 bytes address
    logic                           hwrite;     // Supported value: 1'b0, 1'b1 (R/W request supported)
    logic [2:0]                     hsize;      // Supported value: 3'b010 (4 bytes Transfer Size)
    logic [2:0]                     hburst;     // Supported value: 3'b000 (SINGLE)
    logic [3:0]                     hprot;      // Supported value: 4'b0011 (non-cacheable, non-bufferable, privileged, data access)
    logic [1:0]                     htrans;     // Supported value: 2'b00 (IDLE), 2'b10 (NONSEQ)
    logic                           hmastlock;  // Supported value: 1'b0 (No Lock Transfer)
    logic [AHB_LITE_DATA_WIDTH-1:0]	hwdata;     // 4 bytes write data
    logic                           hsel;       // Indicates if the slave is selected (1'b0: Slave not selected, 1'b1: Slave selected)
  } ahb_req_i_t;

  // AHB REQUEST CHANNEL with hready drive internally
  typedef struct packed {
    logic [AHB_LITE_ADDR_WIDTH-1:0] haddr;      // 4 bytes address
    logic                           hwrite;     // Supported value: 1'b0, 1'b1 (R/W request supported)
    logic [2:0]                     hsize;      // Supported value: 3'b010 (4 bytes Transfer Size)
    logic [2:0]                     hburst;     // Supported value: 3'b000 (SINGLE)
    logic [3:0]                     hprot;      // Supported value: 4'b0011 (non-cacheable, non-bufferable, privileged, data access)
    logic [1:0]                     htrans;     // Supported value: 2'b00 (IDLE), 2'b10 (NONSEQ)
    logic                           hmastlock;  // Supported value: 1'b0 (No Lock Transfer)
    logic [AHB_LITE_DATA_WIDTH-1:0]	hwdata;     // 4 bytes write data
    logic                           hready;     // Indicates the status of current transfer (1'b0: WAIT STATE, 1'b1: TRANSFER COMPLETED)
    logic                           hsel;       // Indicates if the slave is selected (1'b0: Slave not selected, 1'b1: Slave selected)
  } ahb_req_t;

  // AHB RESPONSE CHANNEL
  typedef struct packed {
    logic [AHB_LITE_DATA_WIDTH-1:0] hrdata;     // 4 bytes
    logic                           hresp;      // Supported value: 1'b0 (SUCCESS Response), 1'b1 (ERROR Response)
    logic                           hreadyout;  // Indicates the status of current transfer (1'b0: WAIT STATE, 1'b1: TRANSFER COMPLETED)
  } ahb_resp_t;

endpackage
