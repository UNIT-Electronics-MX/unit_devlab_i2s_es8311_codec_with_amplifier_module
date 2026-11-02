# UNIT I2S ES8311 Codec with Amplifier Module

The UE0097 module provides mono audio recording and playback for an external
controller. It combines an ES8311 audio codec, an NS4150B speaker amplifier,
an analog microphone input, a 3.5 mm audio jack, a two-pin speaker output,
I2S/PCM audio signals, and I2C control.

<div align="center">
  <img src="hardware/img/unit_top_v_1_1_0_i2s_es8311_codec_with_amplifier_module.png" width="450px" alt="UE0097 I2S ES8311 Codec with Amplifier Module top view">
  <p><em>UNIT I2S ES8311 Codec with Amplifier Module</em></p>
</div>

<div align="center">

### Quick Setup

<img src="https://img.shields.io/badge/Product%20Wiki-pending-lightgrey?style=for-the-badge" alt="Product Wiki pending">
[<img src="https://img.shields.io/badge/Datasheet-green?style=for-the-badge" alt="Product Reference">](docs/hardware/unit_product_reference_v_0_1_0_i2s_es8311_codec_with_amplifier_module.pdf)
[<img src="https://img.shields.io/badge/Buy%20Now-orange?style=for-the-badge" alt="Buy Now">](https://uelectronics.com/)
[<img src="https://img.shields.io/badge/Getting%20Started-purple?style=for-the-badge" alt="Getting Started">](software/README.md)

</div>

## Overview

| Feature | Description |
|---|---|
| Product | UNIT I2S ES8311 Codec with Amplifier Module |
| MPN | UE0097 |
| Audio codec | ES8311 |
| Speaker amplifier | NS4150B |
| Audio interfaces | I2S/PCM data and I2C control |
| Audio inputs | Analog microphone connector |
| Audio outputs | Two-pin speaker output and 3.5 mm audio jack |
| Available hardware revisions | V1.1.0 board images; revision 2.0 schematic |

## Applications

| Application | Module path |
|---|---|
| Microphone capture | Analog microphone connector to ES8311 ADC and ASDOUT |
| Speaker playback | Host DSDIN1 to ES8311 DAC and NS4150B amplifier |
| 3.5 mm audio playback | Host DSDIN1 to ES8311 DAC and jack circuit |
| Bidirectional voice | Simultaneous record and playback paths |

These paths describe connections in the supplied schematic. Application-level
performance has not been characterized.

## Resources

### Product Reference

The [Product Reference source](tools/product-reference/README.md) preserves the
existing chapter structure and leaves unsupported specification values empty.
The publication workflow builds the PDF and DOCX and lists them on the
[hardware downloads page](docs/hardware/index.html).

### Hardware sources

- [UE0097 revision 2.0 schematic](hardware/resources/unit_sch_v_2_0_0_i2s_es8311_codec_with_amplifier_module.pdf)
- [ES8311 User Guide](hardware/resources/es8311_user_guide.pdf)
- [Top and bottom board views](hardware/assets/README.md)
- [Hardware overview](hardware/README.md)

The board images are labelled V1.1.0, while the available schematic is
revision 2.0. Verify the physical board revision before relying on connector
orientation or assembly options.

## 📝 License

The repository's original material is covered by [LICENSE](LICENSE).
Third-party documents, including the ES8311 User Guide, retain their own
terms.

<div align="center">
  <sub>Template created by UNIT Electronics</sub>
</div>
