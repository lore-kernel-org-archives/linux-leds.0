From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH/RFC v2] leds: trigger: Introduce a NETDEV trigger
Date: Tue,  5 Dec 2017 11:19:10 +0000
Message-ID: <1512472751-10928-1-git-send-email-ben.whitten@lairdtech.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:46580 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752201AbdLELTq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Dec 2017 06:19:46 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, pavel@ucw.cz, jacek.anaszewski@gmail.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Ben Whitten <ben.whitten@gmail.com>

From: Ben Whitten <ben.whitten@gmail.com>

The patch was converted to led_blink_oneshot, in doing so we find that the
behaviour has changed. As I dont want to break 'userspace' led behaviour this
patch shouldn't be merged as is. Open to suggestions.

Given an interval of 50ms and heavy throughput, the previous implementation
produced a blink with 100ms period and 50% dutycycle. The led_blink_oneshot
version produces a blink with 140ms period and 57% dutycycle.
I assume a fudge factor on the oneshot delay to bring the period back to 100ms
would be device specific so not suitable.

Kind regards,
Ben Whitten (1):
  leds: trigger: Introduce a NETDEV trigger

 .../ABI/testing/sysfs-class-led-trigger-netdev     |  45 ++
 drivers/leds/trigger/Kconfig                       |   7 +
 drivers/leds/trigger/Makefile                      |   1 +
 drivers/leds/trigger/ledtrig-netdev.c              | 507 +++++++++++++++++++++
 4 files changed, 560 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-netdev
 create mode 100644 drivers/leds/trigger/ledtrig-netdev.c

-- 
2.7.4
