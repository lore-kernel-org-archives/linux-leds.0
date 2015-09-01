From: Luis de Bethencourt <luis@debethencourt.com>
Subject: [PATCH 0/6] leds: Fix module autoload for OF platform drivers
Date: Tue, 1 Sep 2015 23:34:50 +0200
Message-ID: <20150901213450.GA14225@goodgumbo.baconseed.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:36000 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbbIAVex (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Sep 2015 17:34:53 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hello,

This series adds the missing MODULE_DEVICE_TABLE() for OF to eport
that information so modules have the correct aliases built-in and
autoloading works correctly.

A longer explanation by Javier Canillas can be found here:
https://lkml.org/lkml/2015/7/30/519

Thanks,
Luis

Luis de Bethencourt (6):
  leds: aat1290: Fix module autoload for OF platform driver
  leds: bcm6328: Fix module autoload for OF platform driver
  leds: bcm6358: Fix module autoload for OF platform driver
  leds: ktd2692: Fix module autoload for OF platform driver
  leds: max77693: Fix module autoload for OF platform driver
  leds: leds-ns2: Fix module autoload for OF platform driver

 drivers/leds/leds-aat1290.c  | 1 +
 drivers/leds/leds-bcm6328.c  | 1 +
 drivers/leds/leds-bcm6358.c  | 1 +
 drivers/leds/leds-ktd2692.c  | 1 +
 drivers/leds/leds-max77693.c | 1 +
 drivers/leds/leds-ns2.c      | 1 +
 6 files changed, 6 insertions(+)

-- 
2.4.6
