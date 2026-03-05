/***************************************************************************
// Copyright (c) 2026 by 10xEngineers.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Author: Gull Ahmed (gull.ahmed@10xengineers.ai)
// Date: March 05, 2026
***************************************************************************/

package axi_c_pkg;

  import config_cycle_acc_pkg::*;

  typedef struct packed {
    logic [MASTER_ID_WIDTH-1:0]  aw_id;
    logic [AXI_ADDR_WIDTH-1:0]   aw_addr;
    logic [7:0]                  aw_len;
    logic [2:0]                  aw_size;
    logic [1:0]                  aw_burst;
    logic                        aw_lock;
    logic [3:0]                  aw_cache;
    logic [2:0]                  aw_prot;
    logic [3:0]                  aw_qos;
    logic [3:0]                  aw_region;
    logic [MASTER_USER_WDTH-1:0] aw_user;
  } aw_channel_t;

  typedef struct packed {
    logic [AXI_DATA_WIDTH-1:0]   w_data;
    logic [AXI_STRB_WIDTH-1:0]   w_strb;
    logic                        w_last;
    logic [MASTER_USER_WDTH-1:0] w_user;
  } w_channel_t;

  typedef struct packed {
    logic [MASTER_ID_WIDTH-1:0]  b_id;
    logic [1:0]                  b_resp;
    logic [MASTER_USER_WDTH-1:0] b_user;
  } b_channel_t;

  typedef struct packed {
    logic [MASTER_ID_WIDTH-1:0]  ar_id;
    logic [AXI_ADDR_WIDTH-1:0]   ar_addr;
    logic [7:0]                  ar_len;
    logic [2:0]                  ar_size;
    logic [1:0]                  ar_burst;
    logic                        ar_lock;
    logic [3:0]                  ar_cache;
    logic [2:0]                  ar_prot;
    logic [3:0]                  ar_qos;
    logic [3:0]                  ar_region;
    logic [MASTER_USER_WDTH-1:0] ar_user;
  } ar_channel_t;

  typedef struct packed {
    logic [MASTER_ID_WIDTH-1:0]  r_id;
    logic [AXI_DATA_WIDTH-1:0]   r_data;
    logic [1:0]                  r_resp;
    logic                        r_last;
    logic [MASTER_USER_WDTH-1:0] r_user;
  } r_channel_t;

endpackage
