## **2 Ratings**

The tables distinguish ES8311 component conditions from values validated for
the complete module. An empty cell means the supplied documentation
does not specify that value. It is not a zero value or permission to apply any
value.

### **2.1 Recommended Operating Conditions** {.section-page}

| Parameter | Minimum | Typical | Maximum | Scope / source |
|---|---:|---:|---:|---|
| ES8311 AVDD | 1.7 V | 3.3 V | 3.6 V | ES8311 User Guide, section 2 |
| ES8311 PVDD | 1.6 V | 3.3 V | 3.6 V | ES8311 User Guide, section 2 |
| ES8311 DVDD | 1.6 V | 3.3 V | 3.6 V | ES8311 User Guide, section 2 |
| Module VCC input | | | | Board-level limit not supplied |
| Module 3V3 output current | | | | Board-level limit not supplied |
| Module speaker load | | | | Board-level limit not supplied |
| Module operating temperature | | | | Board-level limit not supplied |

The board image labels the header supply as +5V. This identifies the intended
nominal input marking, but the supplied documents give no validated module
input range. The ES8311 supply values above do not define VCC limits because
VCC also supplies both regulators and the amplifier.

### **2.2 Power Domains and Power Distribution**

The schematic routes VCC to the NS4150B amplifier, the power LED, J4 and J6,
and the inputs of U1 and U2. U1 produces the 3V3 net; U2 produces A_3V3.
The ES8311 power pins and I2C address pull-up use 3V3. Its AVDD pin uses
A_3V3. Analog and digital grounds meet through the shown zero-ohm coupling
element. The maximum safe module input, rail load, and dissipation have no
board-level specification in the supplied documents.

### **2.3 Digital Interfaces**

| Interface | Board connection | Documented behavior |
|---|---|---|
| I2C control | J4 SDA/SCL and J6 SDA/SCL | ES8311 CE is pulled to 3V3 through R5; guide maps this to 7-bit address 0x19 |
| Digital audio | J4 MCLK, SCLK, LRCK, ASDOUT, DSDIN1 | ES8311 supports I2S, left-justified, and DSP-A/B formats |
| Amplifier enable | J4 PA_CTRL | Connected to NS4150B CTRL through R12 |
| Digital microphone | ES8311 multiplexed pins | Component capability; no external digital-microphone connector is documented |

The guide describes ES8311 master and slave audio modes. It does not establish
which mode a particular host application must use.

### **2.4 Confirmed Component Values**

| Parameter | Value | Scope |
|---|---|---|
| ADC signal-to-noise ratio | 100 dB | ES8311 guide feature claim |
| DAC signal-to-noise ratio | 110 dB | ES8311 guide feature claim |
| ADC output sample rate | Up to 96 kHz | ES8311 guide description |
| ES8311 I2C address with CE high | 0x19, 7-bit | Guide plus R5 schematic connection |
| Module audio signal-to-noise ratio | | Not characterized |
| Module output power | | Not characterized |

Component figures are not guaranteed assembled-module performance.

### **2.5 Application-Dependent and Uncharacterized Parameters** {.section-page}

| Parameter | Module value |
|---|---|
| Total operating current | |
| Amplifier output power and distortion | |
| Validated speaker impedance | |
| Microphone bias voltage and supported microphone types | |
| Input gain and full-scale input at J2/J3 | |
| End-to-end latency and noise | |
| ESD, EMC, and environmental limits | |

### **2.6 Electrical Precautions** {.section-page}

1. Keep host ground common with the module and verify the VCC rail before
   connection. The +5V label does not document an allowable voltage range.
2. J6 carries VCC in the schematic. Do not assume its supply is the 3.3 V
   normally associated with QWIIC accessories; check the connected device.
3. Do not derive a safe speaker load or amplifier output power from the
   ES8311 headphone-driver specification. The speaker is driven by NS4150B.
4. Do not connect a speaker output to a host logic or line-level input.
