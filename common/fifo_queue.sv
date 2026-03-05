/***************************************************************************
// Copyright (c) 2026 by 10xEngineers.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Author: Gull Ahmed (gull.ahmed@10xengineers.ai)
// Date: March 05, 2026
// Description:
***************************************************************************/

// FIFO class: default type = int, default depth = 32
  class fifo_queue #(type T = int, int MAX_DEPTH = 32);
    // Internal queue
    T queue[$];

    // Push method
    function void push(T data);
      if (queue.size() < MAX_DEPTH) begin
        queue.push_back(data);
      end else begin
        $display("FIFO full, cannot push %0p", data);
      end
    endfunction

    // Pop method
    function bit pop(output T data);
      if (queue.size() > 0) begin
        data = queue.pop_front();
        return 1; // success
      end else begin
        $display("[%0t] FIFO empty, returning default value", $time);
        data = '0;
        return 0;  // empty
      end
    endfunction

    function bit peek(output T data);
      if (queue.size() > 0) begin
        data = queue[0];   // front element — the one pop() will remove
        return 1;
      end
      data = '0;
      return 0;
    endfunction

    // Check size
    function int size();
      return queue.size();
    endfunction

    task automatic discard_n(input int n);
      if (n <= 0) return;

      if (queue.size() <= n)
        queue.delete();
      else
        queue = queue[n:$];   // keep entries starting at index n
    endtask

    // Helper methods
    function bit is_empty(); return (queue.size() == 0); endfunction
    function bit is_full();  return (queue.size() >= MAX_DEPTH); endfunction
  endclass