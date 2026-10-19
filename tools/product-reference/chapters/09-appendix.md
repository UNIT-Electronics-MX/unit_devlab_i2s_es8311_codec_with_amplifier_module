## **9 Appendix**

### **9.1 Schematic**

The source drawing is
[Revision 2.0 schematic](https://github.com/UNIT-Electronics-MX/unit_devlab_i2s_es8311_codec_with_amplifier_module/blob/main/hardware/resources/unit_sch_v_2_0_0_i2s_es8311_codec_with_amplifier_module.pdf).
Its title block states sheet 1 of 2, while the supplied PDF contains one
page. A second page has not been supplied.

#### **9.1.1 Codec, Power, Amplifier, and Connectors**

The available PDF page includes IC1 ES8311, IC2 NS4150B, U1/U2 regulators,
J1/J2/J3/J4/J6, microphone bias, and ground coupling.

#### **9.1.2 Additional Schematic Sheet**

| Field | Value |
|---|---|
| Additional sheet file | |
| Additional circuits | |

#### **9.1.3 Controlled Mechanical Drawing**

| Field | Value |
|---|---|
| Drawing file | |
| Drawing revision | |

### **9.2 Technical References**

1. The board schematic revision 2.0 defines the circuit and connector
   signal names.
2. The ES8311 User Guide Rev 1.11 defines codec component characteristics
   and register-level interface behavior.
3. The V1.1.0 top and bottom images identify visible parts and labels but do
   not validate the revision 2.0 electrical implementation.

### **9.3 Values Not Specified by the Technical Documentation** {.section-page}

| Missing board-level item | Value |
|---|---|
| Validated VCC input range | |
| Module current and power budget | |
| Speaker load and amplifier power rating | |
| Microphone electrical compatibility | |
| 3.5 mm plug-contact standard | |
| Connector mating part numbers | |
| Overall dimensions and mounting coordinates | |
| Environmental limits and qualification | |
| Tested codec initialization and firmware | |
| Rev 2.0 assembly-to-image correspondence | |

### **9.4 Document Control** {.section-page}

| Field | Value |
|---|---|
| Product | UNIT I2S ES8311 Codec with Amplifier Module |
| SKU / MPN | UE0097 |
| Schematic revision | 2.0 |
| Board image file revision | V1.1.0 |
| Product Reference | Version 0.1.0 |
| Publication date | 2026-10-19 |
| Firmware revision | |

### **9.5 Source Inconsistencies** {.section-page}

- The board image filenames contain V1.1.0; the schematic title block
  identifies revision 2.0. The available sources do not reconcile them.
- The schematic title block identifies sheet 1 of 2, but the supplied PDF
  has one page.
- The images call J6 QWIIC and mark the board supply +5V. The schematic
  connects J6 supply to VCC, not to the regulated 3V3 net.
- The ES8311 guide cover displays Rev 1.00 while its page footers display
  Rev 1.11. Component facts in this document are cited to the supplied file.

### **9.6 Hardware Errata** {.section-page}

| Erratum | Status | Resolution |
|---|---|---|
| | | |

No verified hardware erratum is included in the supplied sources.
