## **2 Ratings**

The module uses separate regulated rails for its digital and analog audio
paths. ES8311 values below describe the codec inside the product; they do not
set limits for the complete assembly. Blank cells are product ratings that
have not been established.

### **2.1 Recommended Operating Conditions** {.section-page}

| Parameter | Minimum | Typical | Maximum |
|---|---:|---:|---:|
| ES8311 AVDD | 1.7 V | 3.3 V | 3.6 V |
| ES8311 PVDD | 1.6 V | 3.3 V | 3.6 V |
| ES8311 DVDD | 1.6 V | 3.3 V | 3.6 V |
| Module VCC input | | | |
| Module 3V3 output current | | | |
| Module speaker load | | | |
| Module operating temperature | | | |

J4 is marked +5V. The allowable VCC range has not been established;
VCC also powers the regulators and speaker amplifier, so the ES8311 supply
values above cannot be used as the product input range.

### **2.2 Power Domains and Power Distribution**

The module distributes VCC to the speaker amplifier, power indicator, J4, J6,
and two regulators. U1 produces 3V3 for digital circuitry and the I2C address
pull-up; U2 produces A_3V3 for the codec's analog supply. Analog and digital
grounds meet through a zero-ohm coupling element.

### **2.3 Digital Interfaces** {.section-page}

| Interface | Module connection | Product function |
|---|---|---|
| I2C control | J4 SDA/SCL and J6 SDA/SCL | Configures the ES8311 at 7-bit address 0x19 with CE pulled high |
| Digital audio | J4 MCLK, SCLK, LRCK, ASDOUT, DSDIN1 | Carries mono capture and playback data; format is configured by the host |
| Amplifier control | J4 PA_CTRL | Controls the NS4150B through R12 |

The host application selects an audio format and compatible clock mode.

### **2.4 Audio Performance Reference**

The following ES8311 figures provide context for audio designs using this
module; they are not measured performance of the assembled product.

| Parameter | Value |
|---|---|
| ADC signal-to-noise ratio | 100 dB |
| DAC signal-to-noise ratio | 110 dB |
| ADC output sample rate | Up to 96 kHz |

### **2.5 Application-Dependent and Uncharacterized Parameters** {.section-page}

Operating current, amplifier output power, supported speaker load,
microphone compatibility, audio signal levels and quality, and environmental
limits have not been characterized. Section 9.3 lists the open ratings.

### **2.6 Electrical Precautions** {.section-page}

1. Keep host ground common with the module and verify the VCC rail before
   connection. The +5V label does not document an allowable voltage range.
2. J6 carries VCC. Check the attached device's supply requirements before
   connecting it.
3. Do not derive a safe speaker load or amplifier output power from the
   ES8311 headphone-driver specification. The speaker is driven by NS4150B.
4. Do not connect a speaker output to a host logic or line-level input.
