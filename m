From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2 0/3] PCA9633: Add support to PCA9634 and fix some problems
Date: Thu,  8 Aug 2013 18:45:32 +0200
Message-ID: <1375980335-19943-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:60168 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751242Ab3HHQpl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Aug 2013 12:45:41 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Meerwald <p.meerwald@bct-electronic.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>


Add Support for the PCA9634 chip. Simimart to the 9633, but with 8 outputs instead of 4.
Fix bug when 2 chips where present on the system, the ledclass will fail and the chip wont probe.
Protect ledout register with a mutex to support updates of more than leds at the same time


v2: Contains feedback from Peter Meerwald

Peter: Fix typo on commit message. Add bus number to name

Ricardo Ribalda Delgado (3):
  leds-pca9633: Add support for PCA9634
  leds-pca9633: Unique naming of the LEDs
  leds-pca9633: Add mutex to the ledout register

 drivers/leds/Kconfig        |    7 +--
 drivers/leds/leds-pca9633.c |  113 ++++++++++++++++++++++++++++++++-----------
 2 files changed, 88 insertions(+), 32 deletions(-)

-- 
1.7.10.4

