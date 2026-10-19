## **4 Connectors & Pinouts**

This chapter transcribes the revision 2.0 schematic. Pin numbering is
electrical numbering in that schematic. Before wiring physical connectors,
confirm pin-1 orientation on the actual board revision.

### **4.1 J4 Host Header Pinout** {.section-page}

J4 is the ten-position castellated host header.\
![Top view showing the J4 host header signals and microphone and speaker connectors](hardware/pinout/unit_j4_header_pinout_v_0_1_0_i2s_es8311_codec_with_amplifier_module.png){width=6.5in}

Directions are relative to the module.

| J4 pin | Signal | Direction | Function |
|---:|---|---|---|
| 1 | VCC | Input | Module supply (+5V marking) |
| 2 | GND | Return | Ground reference |
| 3 | SCL | Input | I2C clock from host |
| 4 | SDA | Bidirectional | I2C register data |
| 5 | MCLK | Input | Codec master clock |
| 6 | SCLK | Input / output | Serial audio bit clock |
| 7 | ASDOUT | Output | ADC samples to host |
| 8 | LRCK | Input / output | Audio frame clock |
| 9 | DSDIN1 | Input | DAC samples from host |
| 10 | PA_CTRL | Input | NS4150B amplifier control |

SCLK and LRCK are inputs in slave mode and outputs in master mode.

Software names include the I2C or I2S prefix to identify the interface;
hardware references often use shorter signal names. BCLK and SCLK name the
same serial bit clock, while WS and LRCK name the same audio frame clock.
The Function PCB names below come from a different board version and serve
only as a functional cross-reference. They are not a transcription of this
board's silkscreen. DIN and DOUT in this table are relative to the codec.
Use the revision 2.0 schematic signal and J4 pin to identify each connection:

| Software function | Function PCB (reference version) | Schematic signal / J4 pin |
|---|---|---|
| PA_CTRL | PA | PA_CTRL / 10 |
| I2C_SDA | SDA | SDA / 4 |
| I2C_SCL | SCL | SCL / 3 |
| I2S_BCLK | SCLK | SCLK / 6 |
| I2S_DIN | SDIN | DSDIN1 / 9 |
| I2S_WS (LRCK) | LRCK | LRCK / 8 |
| I2S_MCLK | MCLK | MCLK / 5 |
| I2S_DOUT | SDOUT | ASDOUT / 7 |

Host software may name DIN and DOUT from the host's perspective. For playback,
connect host transmit (DOUT/TX) to module DSDIN1 on J4 pin 9. For recording,
connect module ASDOUT on J4 pin 7 to host receive (DIN/RX). Match the signal
direction and pin number rather than two identical-looking names.

The available V1.1.0 board image marks J4 pins 7 and 9 as OUT and DSDIN,
respectively. The header illustration uses DOUT and DIN for those signals.
OUT is digital ADC data, not the speaker output. Confirm the connector
orientation on the actual board before wiring it.

### **4.2 Host Pinout Compatibility** {.section-page}

| Host requirement | Module connection | Validated host mapping |
|---|---|---|
| I2C SCL / SDA | J4 pins 3 / 4 | |
| I2S MCLK / SCLK / LRCK | J4 pins 5 / 6 / 8 | |
| I2S ADC receive | J4 pin 7 | |
| I2S DAC transmit | J4 pin 9 | |
| Amplifier control | J4 pin 10 | |
| Supply / return | J4 pins 1 / 2 | |

The module does not implement an Arduino Nano pinout. Host GPIO numbers,
voltage compatibility, and required firmware depend on the chosen controller.

### **4.3 QWIIC Connector** {.section-page}

| J6 pin | Schematic net |
|---:|---|
| 1 | VCC |
| 2 | AGND |
| 3 | SDA |
| 4 | SCL |

The board calls J6 QWIIC, while the schematic connects its supply contact
to VCC. Connector pitch, mating part, and safe voltage for attached devices
are not established by the supplied documentation.

### **4.4 Microphone Connector** {.section-page}

J2 is a two-position connector for the external analog microphone circuit.
The schematic shows pin 1 on the MIC1P path and pin 2 on the MIC1N path.
Connector polarity and microphone electrical requirements must be checked
against the actual assembly.

### **4.5 Speaker Connections**

J1 is the two-position speaker connector: pin 1 is OUT+ and pin 2 is OUT−.
These are the differential outputs of the NS4150B amplifier. Neither contact
is a ground return.

### **4.6 3.5 mm Audio Jack** {.section-page}

J3 is a PJ-320D jack connected to the codec output path, MIC1P circuit, and
analog ground. The supplied schematic does not define a tested headset wiring
standard or a user-facing plug-contact pinout.

### **4.7 Power and Amplifier Control**

VCC enters through J4 and is also present at J6. There is no USB, BOOT, or
reset circuit on this module. J4 pin 10 carries PA_CTRL; the schematic connects
it to IC2 CTRL through R12. The required logic thresholds and safe power-up
sequence are not specified at module level.

### **4.8 Test Pads and Assembly Options** {.section-page}

The images show solder options labelled amplifier off and I2C address. The
revision 2.0 schematic shows a PA_CTRL-to-ground option and an ES8311 CE
pull-up. The default assembled configuration and rework instructions for
those options are not documented. Confirm the populated board before changing
either option.
