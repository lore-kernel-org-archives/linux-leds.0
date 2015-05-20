From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 0/20] leds: put hard limit on minimum blink period for slow
 leds
Date: Wed, 20 May 2015 18:17:30 +0300
Message-ID: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org


Currently the timer trigger allows to set blink period as small as
1mS. But in fact the minimum period is jiffy, which is usually 10mS.
The following mail says:
http://lkml.iu.edu/hypermail/linux/kernel/1504.3/03469.html
<<
As I mentioned before even with hr timer it wouldn't be possible
to assure that 1ms is achievable due to locking and bus latency
reasons.
>>
So the limit of 10mS should be enforced for drivers that use
waiting operations, like transfers across slow bus.
This allows to stay on safe side when CONFIG_HZ is set to eg 1000.

This patch set differentiates the "fast" drivers by marking them
with the new LED_BRIGHTNESS_FAST flag. For these drivers, setting
periods as small as 1mS is possible (provided CONFIG_HZ is set
appropriately), while for "slow" drivers the limit of 10mS in enforced.
In the future, the "fast" drivers may get used by a software PWM.


 drivers/leds/dell-led.c                |    2 +-
 drivers/leds/led-core.c                |   30 +++++++++++++++++++-----------
 drivers/leds/led-triggers.c            |    8 +++++---
 drivers/leds/leds-asic3.c              |    2 +-
 drivers/leds/leds-bcm6328.c            |    1 +
 drivers/leds/leds-clevo-mail.c         |    2 +-
 drivers/leds/leds-cobalt-qube.c        |    1 +
 drivers/leds/leds-cobalt-raq.c         |    2 ++
 drivers/leds/leds-fsg.c                |   12 ++++++------
 drivers/leds/leds-gpio.c               |    2 ++
 drivers/leds/leds-hp6xx.c              |    4 ++--
 drivers/leds/leds-locomo.c             |    2 ++
 drivers/leds/leds-net48xx.c            |    2 +-
 drivers/leds/leds-netxbig.c            |    2 +-
 drivers/leds/leds-ns2.c                |    2 +-
 drivers/leds/leds-ot200.c              |    1 +
 drivers/leds/leds-pwm.c                |    2 ++
 drivers/leds/leds-s3c24xx.c            |    2 +-
 drivers/leds/leds-ss4200.c             |    1 +
 drivers/leds/leds-versatile.c          |    1 +
 drivers/leds/leds-wrap.c               |    6 +++---
 drivers/leds/trigger/ledtrig-oneshot.c |    5 ++++-
 drivers/leds/trigger/ledtrig-timer.c   |   18 +++++++++++++-----
 include/linux/leds.h                   |   12 ++++++++++--
 24 files changed, 82 insertions(+), 40 deletions(-)
