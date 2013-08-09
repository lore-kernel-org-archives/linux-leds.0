From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v3 0/4] PCA9633: Add support to PCA9634 and fix some problems
Date: Fri,  9 Aug 2013 08:45:40 +0200
Message-ID: <1376030744-22645-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:58607 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030292Ab3HIGpv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 9 Aug 2013 02:45:51 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Peter Meerwald <p.meerwald@bct-electronic.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>


Add Support for the PCA9634 chip. Simimart to the 9633, but with 8 outputs instead of 4.
Fix bug when 2 chips where present on the system, the ledclass will fail and the chip wont probe.
Protect ledout register with a mutex to support updates of more than leds at the same time

v2: Contains feedback from Bryan Wu
Bryan: Rename pca9633 to pca963x

v2: Contains feedback from Peter Meerwald
Peter: Fix typo on commit message. Add bus number to name

Ricardo Ribalda Delgado (4):
  leds-pca9633: Add support for PCA9634
  leds-pca9633: Unique naming of the LEDs
  leds-pca9633: Add mutex to the ledout register
  leds-pca9633: Rename to leds-pca963x

 drivers/leds/Kconfig                       |    9 +-
 drivers/leds/Makefile                      |    2 +-
 drivers/leds/leds-pca9633.c                |  194 ----------------------
 drivers/leds/leds-pca963x.c                |  249 ++++++++++++++++++++++++++++
 include/linux/platform_data/leds-pca9633.h |   35 ----
 include/linux/platform_data/leds-pca963x.h |   36 ++++
 6 files changed, 291 insertions(+), 234 deletions(-)
 delete mode 100644 drivers/leds/leds-pca9633.c
 create mode 100644 drivers/leds/leds-pca963x.c
 delete mode 100644 include/linux/platform_data/leds-pca9633.h
 create mode 100644 include/linux/platform_data/leds-pca963x.h

-- 
1.7.10.4

