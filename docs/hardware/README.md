# UE0097 ES8311 Audio Module Hardware

## Scope

This page summarizes the supplied UE0097 schematic revision 2.0. Board images
are tagged V1.1.0 and have not been reconciled with that schematic. Use the
[Product Reference](../tools/product-reference/README.md) for the full chapter
structure, source distinctions, and blank fields for undocumented values.

## Main circuit blocks

| Reference | Part | Function |
|---|---|---|
| IC1 | ES8311 | Mono audio codec and I2S/PCM interface |
| IC2 | NS4150B | Differential speaker amplifier |
| U1, U2 | AP2112K-3.3V | Digital and analog 3.3 V supplies |
| J1 | Two-position connector | Differential speaker output |
| J2 | Two-position connector | Analog microphone circuit |
| J3 | PJ-320D | 3.5 mm audio jack |
| J4 | 10-position castellated header | Power, control, and digital audio |
| J6 | Four-position connector | Power, ground, SDA, and SCL |

## Host header J4

| Pin | Signal | Function |
|---:|---|---|
| 1 | VCC | Module supply, marked +5V on board image |
| 2 | GND | Ground |
| 3 | SDA | I2C data |
| 4 | SCL | I2C clock |
| 5 | MCLK | Master-clock input |
| 6 | SCLK | Serial audio bit clock |
| 7 | ASDOUT | ADC serial audio output |
| 8 | LRCK | Serial audio frame clock |
| 9 | DSDIN1 | DAC serial audio input |
| 10 | PA_CTRL | Amplifier control |

The ES8311 CE pin is pulled high on the supplied schematic, corresponding to
the 7-bit I2C address 0x19 in the ES8311 User Guide. The J6 connector labelled
QWIIC carries VCC, not the regulated 3V3 net. Confirm the attached device's
power and logic requirements before connecting it.

## Available files

- [Revision 2.0 schematic](resources/unit_sch_v_2_0_0_i2s_es8311_codec_with_amplifier_module.pdf)
- [ES8311 User Guide](resources/es8311_user_guide.pdf)
- [Top view](img/unit_top_v_1_1_0_i2s_es8311_codec_with_amplifier_module.png)
- [Bottom view](img/unit_bottom_v_1_1_0_i2s_es8311_codec_with_amplifier_module.png)

Validated VCC limits, speaker load, output power, current consumption, and
mechanical dimensions are not supplied in the available board documents.
