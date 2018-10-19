From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH v2 0/3] UP Squared board drivers
Date: Fri, 19 Oct 2018 18:15:31 +0100
Message-ID: <1539969334-24577-1-git-send-email-dan@emutex.com>
References: <20180421085009.28773-1-javier@emutex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180421085009.28773-1-javier@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Dan O'Donovan <dan@emutex.com>
List-Id: linux-leds@vger.kernel.org

Hi all,

This series adds platform support for AAEON's UP Squared, a x86 SBC
based on Apollo Lake [1]. Specifically, it enables control for the board
pin headers and for the LEDs, as both of these features are only
available behind a FPGA-based platform controller.

This is structured around a MFD driver that provides a regmap interface
to that platform controller to each MFD cell.

The series is carved out from an out-of-tree support patchset, initially
written for the original UP Board [2] and then extended through the past
year to support new entries in the lineup (UP Board, UP Squared and
UP Core) [3].

Here we only submit support for UP Squared to simplify review. Still,
the driver is designed so that it can easily gain support for the other
boards.

V1 was originally submitted by Javier Arteaga in April 2018 as an RFC [4].
This V2 aims to address the feedback gratefully received from that.

[1]: http://www.up-board.org/upsquared/specifications-up2/
[2]: https://lkml.kernel.org/r/1467648434-29080-1-git-send-email-dan@emutex.com
[3]: https://github.com/emutex/ubilinux-kernel/commits/upboard-4.9
[4]: https://lore.kernel.org/lkml/20180421085009.28773-1-javier@emutex.com/

V2:
* Rewrote regmap r/w handlers to avoid duplication and improve readability
* Simplified data passing between MFD parent and child device drivers
* Removed incorrect __init attribute from probe functions
* Moved MFD cell definitions into same patch as MFD driver and simplified them
* Promoted some dev_dbg instances to dev_err for probe error cases
* Decoupled MFD cell reference from ACPI driver data
* Miscellanous coding style improvements
* Fixed license mismatches

Javier Arteaga (3):
  mfd: upboard: Add UP2 platform controller driver
  leds: upboard: Add LED support
  pinctrl: upboard: Add UP2 pinctrl and gpio driver

 drivers/leds/Kconfig              |  10 +
 drivers/leds/Makefile             |   1 +
 drivers/leds/leds-upboard.c       | 104 ++++++++
 drivers/mfd/Kconfig               |  17 ++
 drivers/mfd/Makefile              |   1 +
 drivers/mfd/upboard.c             | 344 +++++++++++++++++++++++++
 drivers/pinctrl/Kconfig           |  13 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-upboard.c | 519 ++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/upboard.h       |  44 ++++
 10 files changed, 1054 insertions(+)
 create mode 100644 drivers/leds/leds-upboard.c
 create mode 100644 drivers/mfd/upboard.c
 create mode 100644 drivers/pinctrl/pinctrl-upboard.c
 create mode 100644 include/linux/mfd/upboard.h

-- 
2.7.4


------
This email has been scanned for spam and malware by The Email Laundry.
