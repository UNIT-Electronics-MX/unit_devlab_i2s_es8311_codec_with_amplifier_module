## **1 The Board**

### **1.1 Accessories** {.section-page}

| Accessory | Purpose |
|---|---|
| I2S-capable host controller | Supplies digital audio and clocks |
| Power source | Supplies VCC and ground |
| Analog microphone | Connects to J2 |
| Mono speaker | Connects to J1 |
| 3.5 mm plug or headset | Connects to J3 |
| Four-position cable | Connects to J6 |

Connector mating part numbers, speaker impedance and power rating, microphone
requirements, and cable orientation are not defined in the supplied board
documentation.

### **1.2 Board Identification**

| Item | Value |
|---|---|
| Product | UNIT I2S ES8311 Codec with Amplifier Module |
| SKU / MPN | UE0097 |
| Product family | UNIT DevLab ecosystem |
| Product type | Mono audio codec and amplifier module |
| Main component | ES8311 |
| Amplifier | NS4150B |
| Schematic revision | 2.0 |
| Image file revision | V1.1.0 |
| Product Reference | Version 0.1.0 |

### **1.3 Main Assemblies**

| RefDes | Component | Schematic function |
|---|---|---|
| IC1 | ES8311 | Mono audio ADC, DAC, and digital audio interface |
| IC2 | NS4150B | Differential speaker amplifier |
| U1, U2 | AP2112K-3.3V | Separate 3.3 V regulator outputs |
| J1 | Two-position connector | Differential speaker output |
| J2 | Two-position connector | External microphone input |
| J3 | PJ-320D | 3.5 mm audio jack |
| J4 | 10-position castellated header | Power, I2C, I2S, and amplifier control |
| J6 | Four-position connector | Power, ground, SDA, and SCL |
| D1 | Green LED | Power indicator |

### **1.4 Board Views** {.section-page}

![Top view of the module](hardware/img/unit_top_v_1_1_0_i2s_es8311_codec_with_amplifier_module.png){width=4.8in}

![Bottom view of the module](hardware/img/unit_bottom_v_1_1_0_i2s_es8311_codec_with_amplifier_module.png){width=4.8in}

The images show connector placement and silkscreen. For electrical connections
in this reference, use the revision 2.0 schematic.

### **1.5 Handling** {.section-page}

Observe normal ESD precautions. Remove power before changing microphone,
speaker, jack, or host wiring. Verify connector pin 1, polarity, and voltage
with the actual hardware revision before applying power.
