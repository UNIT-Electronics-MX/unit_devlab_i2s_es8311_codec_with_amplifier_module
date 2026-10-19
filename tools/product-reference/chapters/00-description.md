## **Description**

The UNIT I2S ES8311 Codec with Amplifier Module (UE0097) is a mono audio
interface for a host controller. The ES8311 converts between analog audio and
digital I2S/PCM audio. The board adds an NS4150B speaker amplifier, an analog
microphone connector, a 3.5 mm audio jack, a two-pin speaker connector, an I2S
header, and an I2C/QWIIC-style connector. An external host supplies clocks,
audio data, control, and power.

![Top view of the audio module](hardware/img/unit_top_v_1_1_0_i2s_es8311_codec_with_amplifier_module.png){width=4.5in}

### **Applications**

- Voice recording and playback in embedded systems
- Intercoms, monitoring equipment, and voice interfaces
- Audio input and output experiments with I2S-capable controllers
- Prototyping with an external analog microphone and mono speaker

| Application path | Host interface | Module audio connection |
|---|---|---|
| Microphone capture | I2C setup, I2S clocks, ASDOUT | J2 analog microphone input |
| Speaker playback | I2C setup, I2S clocks, DSDIN1, PA_CTRL | J1 differential speaker output |
| 3.5 mm audio playback | I2C setup, I2S clocks, DSDIN1 | J3 analog output path |
| Bidirectional voice | I2C setup, I2S input and output | J2 input with J1 or J3 output |

These are potential uses of the documented interfaces, not claims of
application-level validation.

### **Hardware Features**

- ES8311 mono codec with differential microphone input and I2S/PCM port
- NS4150B amplifier connected to the ES8311 differential output
- Separate speaker, microphone, 3.5 mm jack, 10-position header, and
  four-position QWIIC-style connectors
- Two AP2112K-3.3 regulators, power indicator, and amplifier control signal
- Four mounting holes and castellated 2.54 mm header positions
