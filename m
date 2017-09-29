From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fixes for 4.14-rc3
Date: Fri, 29 Sep 2017 22:51:02 +0200
Message-ID: <1506718262-5494-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35877 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752123AbdI2Uwy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 29 Sep 2017 16:52:54 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, sakari.ailus@linux.intel.com, sean.wang@mediatek.com

Hi Linus,

Please pull four fixes for as3645a LED flash controller and
one update to MAINTAINERS.

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led_fixes-4.14-rc3

for you to fetch changes up to f3a0c7b3fa7cdf6783827c245c62772687f8b3ac:

  MAINTAINERS: Add entry for MediaTek PMIC LED driver (2017-09-25 21:33:43 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fixes for 4.14-rc3

----------------------------------------------------------------
Sakari Ailus (4):
      as3645a: Use ams,input-max-microamp as documented in DT bindings
      dt: bindings: as3645a: Use LED number to refer to LEDs
      as3645a: Use integer numbers for parsing LEDs
      as3645a: Unregister indicator LED on device unbind

Sean Wang (1):
      MAINTAINERS: Add entry for MediaTek PMIC LED driver

 .../devicetree/bindings/leds/ams,as3645a.txt       | 28 +++++++++++++--------
 MAINTAINERS                                        |  6 +++++
 arch/arm/boot/dts/omap3-n950-n9.dtsi               | 10 +++++---
 drivers/leds/leds-as3645a.c                        | 29 +++++++++++++++++++---
 4 files changed, 57 insertions(+), 16 deletions(-)
