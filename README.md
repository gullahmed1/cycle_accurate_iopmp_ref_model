# cycle_accurate_iopmp_ref_model

The **cycle-accurate IOPMP reference model** implements the IOPMP (I/O Physical Memory Protection) specification with two complementary pieces:

* **SystemVerilog cycle‑accurate wrapper** – models the detailed timing and handshake of the interface, suitable for SoC integration.
* **C functional reference model** – validates the behaviour and enforcement of protection rules, independent of timing.

This separation allows the functional model to be exercised and verified on its own while the wrapper provides accurate cycle‑by‑cycle behaviour for hardware simulation or emulation. Both components are designed to be fully compliant with the IOPMP specification.

---

## 📁 Repository layout

```
.
├── iopmp_c_model.sv                     # top‑level SystemVerilog wrapper
├── common/                              # shared SystemVerilog utilities
│   ├── common_macros.svh
│   └── fifo_queue.sv
├── include/                             # SV and C package headers
│   ├── ahb_lite_c_pkg.sv
│   ├── axi_c_pkg.sv
│   ├── c_model_pkg.sv
│   ├── config_cycle_acc_pkg.sv
│   └── …
├── iopmp_ref_model/                     # functional C reference model
│   ├── Makefile                         # build the model & tests
│   ├── README.md                        # model‑specific notes
│   ├── include/                         # C headers
│   │   ├── config.h
│   │   ├── iopmp_registers.h
│   │   ├── iopmp_req_rsp.h
│   │   └── iopmp.h
│   ├── src/                             # C implementation files
│   │   ├── iopmp_error_capture.c
│   │   ├── iopmp_interrupt.c
│   │   ├── iopmp_reg.c
│   │   ├── iopmp_rule_analyzer.c
│   │   └── iopmp_validate.c
│   └── verif/                           # verification harness
│       ├── test_utils.c/.h
│       └── tests/                       # example test programs
│           ├── compactmodel.c
│           ├── dynamicmodel.c
│           ├── fullmodel.c
│           ├── isolationmodel.c
│           ├── rapidmodel.c
│           └── … unnamed_model_?.c
└── LICENSE
```

---

## 🚀 Getting started

### Build functional model

```sh
cd iopmp_ref_model
make        # compiles the C reference model and example tests
```

Outputs are placed in `iopmp_ref_model/bin` (or as defined in the Makefile).

### Run tests

The `verif/tests` directory contains sample programs exercising various protection configurations. Simply run them after building:

```sh
./bin/fullmodel
./bin/compactmodel
# … etc.
```

These demonstrators show how rules are configured and validated, and may be used as a basis for your own test harness.

### Use the SystemVerilog wrapper

The top‑level file `iopmp_c_model.sv` instantiates the functional model with a cycle‑accurate interface. Integrate it into a SystemVerilog testbench or a larger design:

```systemverilog
import c_model_pkg::*;

iopmp_c_model #(
  // parameterise width, addresses, etc.
) dut (
  // standard AXI/AHB-lite/other I/O
);
```

Refer to the package headers under `include/` for configuration options and interface definitions.

---

## 🛠️ Features

* **Cycle‑accurate timing** – handshake and bus-cycle modelling in SystemVerilog.
* **Functional correctness** – C model enforces rules and reports violations.
* **Configurable** – parameters for address width, port count, bus protocol.
* **Self‑contained verification** – includes utility functions and sample tests.
* **Standalone C model** – usable for software validation or as a golden reference.

---

## 📖 Documentation

The repository is intended as both a reference for IOPMP implementation and a starting point for integration into SoC verification flows. For a deeper explanation of the IOPMP specification, consult the authoritative spec from the IP provider (not included here).

---

## 📄 License

This project is released under the terms of the [LICENSE](./LICENSE) file.

---

Feel free to expand the README with usage examples, parameter descriptions or links to external documentation as your project evolves.