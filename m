From: <sean.wang@mediatek.com>
Subject: [PATCH v2 0/4] leds: add leds-mt6323 support on MT7623 SoC
Date: Wed, 8 Feb 2017 10:19:13 +0800
Message-ID: <1486520357-13096-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-leds@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

MT7623 SoC uses MT6323 PMIC as the default power supply
which has LED function insides. The patchset introduces
the LED support for MT6323 with on, off and hardware
dimmed and blinked and it should work on other similar
SoCs if also using MT6323.

Changes since v1:
All changes only within 0003-leds-Add-LED-support-for-MT6323-PMIC.patch, 
including below items
- fixed typo in the comments
- sorted include directives alphabetically
- applied all register definitions with MT6323 prefix
- removed the redundant structure declaration
- fixed coding style defined in kernel doc format consistently
- added error handling into all the occurrences where regmap APIs
  are used
- removed loudly debug message
- made magic constant into meaningful macro
- added missing mutex_destroy when module removed called
- updated module license with GPL
- fixed sparse warnings


Sean Wang (4):
  Documentation: devicetree: Add document bindings for leds-mt6323
  Documentation: devicetree: Add LED subnode binding for MT6323 PMIC
  leds: Add LED support for MT6323 PMIC
  mfd: mt6397: Add MT6323 LED support into MT6397 driver

 .../devicetree/bindings/leds/leds-mt6323.txt       |  60 +++
 Documentation/devicetree/bindings/mfd/mt6397.txt   |   4 +
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-mt6323.c                         | 464 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   4 +
 6 files changed, 541 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt
 create mode 100644 drivers/leds/leds-mt6323.c

-- 
1.9.1
