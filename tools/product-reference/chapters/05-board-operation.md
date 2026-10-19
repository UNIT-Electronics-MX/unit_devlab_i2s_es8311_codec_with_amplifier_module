## **5 Board Operation**

The module is a peripheral; setup is performed on an external host. The
ES8311 User Guide provides component-level register and clock information.
The repository currently contains no verified module-specific firmware example.

### **5.1 Getting Started with a Host Controller** {.section-page}

Choose a host with an I2C controller and serial audio interface. Connect
supply, ground, SCL, SDA, serial audio data, and PA_CTRL to the J4 functions
in Chapter 4. Connect MCLK when selected as the codec's internal clock source,
and set the host's SCLK and LRCK direction to match the mode in Section 3.4.
Confirm power and logic compatibility before energizing the board. The correct
host pin numbers and codec driver depend on the host platform.

### **5.2 First Power-up and Inspection**

Inspect connector orientation and the actual revision. Apply the supply
intended for that assembly using a current-limited source. The power LED
should indicate VCC presence. Verify 3V3 and A_3V3 before connecting a
speaker or microphone. The supplied documents contain no module current
limit or production acceptance test.

### **5.3 Control and Clock Workflow**

Use I2C to detect the codec at the 7-bit address 0x19 selected by the
revision 2.0 schematic's CE pull-up. Configure the serial audio format,
word length, clock source, and clock dividers using the ES8311 User Guide.
After reset the codec defaults to slave mode, so the host drives SCLK and LRCK.
If master mode is selected, the codec drives those lines; the host must not
drive them at the same time. MCLK remains an input when selected as the clock
source. Enable the record and playback paths required by the application.
A board-tested register sequence has not been supplied.

### **5.4 Recommended Bring-up Sequence** {.section-page}

| Step | Check | Expected observation |
|---:|---|---|
| 1 | Power | VCC, 3V3, and A_3V3 present |
| 2 | Control | ES8311 responds at the configured I2C address |
| 3 | Clocks | MCLK, SCLK, and LRCK follow the selected mode |
| 4 | Playback | DSDIN1 carries audio data |
| 5 | Record | ASDOUT carries audio data |
| 6 | Amplifier | PA_CTRL selects the desired amplifier state |
| 7 | External audio | J1, J2, and J3 work with verified loads |

Measured pass/fail ranges for these checks are not published.

### **5.5 Firmware Example Collection** {.section-page}

| Platform | Verified example |
|---|---|
| Arduino C++ | |
| MicroPython | |
| Other hosts | |

No module-specific example has been validated in this repository.

### **5.6 Audio Buffer Planning** {.section-page}

Allocate host-side buffers for the selected sample format, clock rate, and
latency target. The module itself has no application RAM or storage.
Buffer size, DMA strategy, and supported host configurations depend on the
host system and are not specified here.

### **5.7 Recording Operation** {.section-page}

J2 supplies the ES8311 analog microphone path. Configure input selection,
gain, filtering, and ADC output format using the User Guide. Confirm the
microphone's electrical needs separately. There is no board-validated
microphone model or sensitivity figure in the supplied sources.

### **5.8 Playback and Recording Coexistence** {.section-page}

The ES8311 supports simultaneous ADC and DAC paths at component level.
The module routes playback toward the jack and amplifier. A host application
must coordinate clocks, serial audio slots, buffer flow, and PA_CTRL. No
combined-system performance or tested configuration is documented.

### **5.9 Troubleshooting Guide** {.section-page}

| Symptom | Check |
|---|---|
| No I2C response | VCC, ground, 3V3, J4 pin 3 SCL / pin 4 SDA, bus pull-ups, CE population, 7-bit address |
| No digital audio | Clock source, SCLK/LRCK direction, matching format and word length, DSDIN1/ASDOUT routing |
| No speaker sound | PA_CTRL, speaker on J1, amplifier VCC, playback path |
| No microphone signal | J2 wiring, input bias, ADC path, gain and routing |
| Unexpected noise | Supply and ground arrangement, clock wiring, analog connections |

These are diagnostic checks, not validated fault signatures.
