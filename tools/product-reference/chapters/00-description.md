## **Description**

The UNIT I2S ES8311 Codec with Amplifier Module (UE0097) provides mono audio
capture and playback for an external host. A microphone connects at J2; audio
can be played through the 3.5 mm jack or a speaker at J1. The host supplies
power, configures the audio path over I2C, and exchanges samples and clocks
over I2S/PCM. Inside the product, the ES8311 handles conversion and the
NS4150B drives the speaker output.

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

- Mono microphone capture and playback over a host-controlled I2S/PCM link
- Differential speaker output with a separate host amplifier-control signal
- Microphone, speaker, and 3.5 mm audio connections
- J4 host header for power, I2C, I2S, and amplifier control; J6 extends I2C
- Separate regulated digital and analog supply nets and a power indicator
