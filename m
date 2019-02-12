From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2 0/2] Intel Cherry Trail Whiskey Cove LEDs support
Date: Tue, 12 Feb 2019 23:58:59 +0300
Message-ID: <20190212205901.13037-1-jekhor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, Yauhen Kharuzhy <jekhor@gmail.com>
List-Id: linux-leds@vger.kernel.org

This patch series introduces new driver for controlling LEDs connected
to Intel Cherry Trail Whiskey Cove PMIC (general-purpose LED and charger
status led). Only simple 'always on' and blinking modes are supported
for now, no breathing.

Driver was tested only with Lenovo Yoga Book notebook, and I don't have
any documentation for the PMIC, so proposals and testing are welcome.

v2:
  - Fix comments and code style
  - Add mutex to protect led state
  - Add defaults triggers
  - Fix module license declaration

Yauhen Kharuzhy (2):
  leds: Add Intel Cherry Trail Whiskey Cove PMIC LEDs
  mfd: Add leds MFD cell for intel_soc_pmic_chtwc

 drivers/leds/Kconfig               |  11 ++
 drivers/leds/Makefile              |   1 +
 drivers/leds/leds-cht-wcove.c      | 293 +++++++++++++++++++++++++++++
 drivers/mfd/intel_soc_pmic_chtwc.c |   1 +
 4 files changed, 306 insertions(+)
 create mode 100644 drivers/leds/leds-cht-wcove.c

-- 
2.20.1
