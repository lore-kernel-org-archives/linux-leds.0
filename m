From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH] Introduce a NETDEV LED trigger
Date: Tue, 28 Nov 2017 21:54:17 +0000
Message-ID: <1511906058-30649-1-git-send-email-ben.whitten@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Ben Whitten <ben.whitten@gmail.com>
List-Id: linux-leds@vger.kernel.org

It's quite useful to be able to trigger LEDs based on network activity,
similar mechanisms exist in routers and gateway devices.
I am looking to mainline a patch that has existed out of tree for
some time in OpenWRT/LEDE.
The patch has been updated and restructured and most of the issues raised
in the initial submission have been addressed [1].

I am also including the netdev mailing list as it was suggested previously
that if there is no activity the interval will still run and is wasteful

[1] https://lkml.org/lkml/2010/11/14/116

Ben Whitten (1):
  leds: trigger: Introduce a NETDEV trigger

 .../ABI/testing/sysfs-class-led-trigger-netdev     |  45 +++
 drivers/leds/trigger/Kconfig                       |   7 +
 drivers/leds/trigger/Makefile                      |   1 +
 drivers/leds/trigger/ledtrig-netdev.c              | 428 +++++++++++++++++++++
 4 files changed, 481 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-netdev
 create mode 100644 drivers/leds/trigger/ledtrig-netdev.c

-- 
2.7.4
