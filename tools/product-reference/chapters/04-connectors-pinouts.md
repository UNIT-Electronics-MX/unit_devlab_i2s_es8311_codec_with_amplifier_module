## **4 Connectors & Pinouts**

This chapter transcribes the revision 2.0 schematic. Pin numbering is
electrical numbering in that schematic. Before wiring physical connectors,
confirm pin-1 orientation on the actual board revision.

### **4.1 General Pinout** {.section-page}

J4 is the ten-position castellated host header.

| J4 pin | Signal | Function |
|---:|---|---|
| 1 | VCC | Module supply, marked +5V on board image |
| 2 | GND | Ground |
| 3 | SDA | I2C data |
| 4 | SCL | I2C clock |
| 5 | MCLK | ES8311 master-clock input |
| 6 | SCLK | Serial audio bit clock |
| 7 | ASDOUT | ADC serial audio output |
| 8 | LRCK | Serial audio frame clock |
| 9 | DSDIN1 | DAC serial audio input |
| 10 | PA_CTRL | NS4150B control |

The top image abbreviates ASDOUT as OUT. The schematic uses ASDOUT; it is
digital audio data, not the speaker output.

### **4.2 Host Pinout Compatibility** {.section-page}

| Host requirement | Module connection | Validated host mapping |
|---|---|---|
| I2C SDA / SCL | J4 pins 3 / 4 | |
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
