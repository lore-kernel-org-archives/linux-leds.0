From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 0/3] Led core cleanup
Date: Thu, 07 Aug 2014 14:10:21 +0200
Message-ID: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22944 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754303AbaHGMKo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Aug 2014 08:10:44 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9X000NMR5JE620@mailout1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 07 Aug 2014 21:10:31 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>

This patch set contains led core cleanup patches extracted from
the series "LED / flash API integration".

Thanks,
Jacek Anaszewski

Jacek Anaszewski (3):
  leds: Reorder include directives
  leds: make brightness type consistent across whole subsystem
  leds: avoid using DEVICE_ATTR macro for max_brightness attribute

 drivers/leds/led-class.c |   16 ++++++++--------
 drivers/leds/led-core.c  |    2 +-
 include/linux/leds.h     |    6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.9.5
