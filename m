From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/7] Standardize onboard LED support for 96Boards
Date: Mon, 29 Oct 2018 14:29:59 +0530
Message-ID: <20181029090006.4353-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, heiko@sntech.de, ezequiel@collabora.com, xuwei5@hisilicon.com, michal.simek@xilinx.com, pavel@ucw.cz, andy.gross@linaro.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linus.walleij@linaro.org, koen.kooi@linaro.org, nicolas.dechesne@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: linux-leds@vger.kernel.org

This patchset standardizes the onboard LEDs on 96Boards by maintaining
common labels and triggers as below:

green:user1  default-trigger: heartbeat
green:user2  default-trigger: mmc0/disk-activity (onboard-storage)
green:user3  default-trigger: mmc1 (SD card)
green:user4  default-trigger: none, panic-indicator
yellow:wlan  default-trigger: phy0tx
blue:bt      default-trigger: hci0-power

This standardization is required to provide a common behaviour of LEDs
across all mainline supported 96Boards and also making it easier to
control it using an userspace library like MRAA.

For Rock960 and Ficus boards, the LED support is added in this patchset.
Rest of the boards are converted to adopt the standard.

Note: Since there is no UFS trigger available for now, user2 LED trigger
is set to none on HiKey960.

Thanks,
Mani

Changes in v2:

* Removed device-name from LED labels as per the suggestion from Simon
  and Pavel
* Adopted APQ8016 SBC (Dragonboard410c)
* Tested the Ficus patch on Ficus V1.1 board
* CCed LED mailing list

Manivannan Sadhasivam (7):
  arm64: dts: rockchip: ficus: Add on-board LED support
  arm64: dts: rockchip: rock960: Add on-board LED support
  arm64: dts: hisilicon: hikey: Standardize LED labels and triggers
  arm64: dts: hisilicon: hikey960: Standardize LED labels and triggers
  arm64: dts: hisilicon: poplar: Standardize LED labels and triggers
  arm64: dts: xilinx: ultra96: Standardize LED labels and triggers
  arm64: dts: qcom: apq8016-sbc: Standardize LED labels

 .../boot/dts/hisilicon/hi3660-hikey960.dts    | 18 ++---
 .../boot/dts/hisilicon/hi3798cv200-poplar.dts | 13 +--
 .../arm64/boot/dts/hisilicon/hi6220-hikey.dts | 17 ++--
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 12 +--
 arch/arm64/boot/dts/rockchip/rk3399-ficus.dts | 78 ++++++++++++++++++
 .../boot/dts/rockchip/rk3399-rock960.dts      | 79 +++++++++++++++++++
 .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    | 15 ++--
 7 files changed, 196 insertions(+), 36 deletions(-)

-- 
2.17.1
