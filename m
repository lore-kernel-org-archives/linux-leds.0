From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] leds: gpio: Allow retaining state on shutdown
Date: Fri, 25 Aug 2017 16:05:01 +0930
Message-ID: <20170825063503.31577-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
List-Id: linux-leds@vger.kernel.org

Hello,

LEDs controlled by BMCs are sometimes required to retain their state across BMC
resets. BMC resets may occur whilst the host is alive, thus the chassis and
host system remain powered up. In these two patches I define an new devicetree
property to describe the behaviour for GPIO LEDs and add support to the
leds-gpio driver.

Please review!

Cheers,

Andrew

Andrew Jeffery (2):
  dt-bindings: leds: gpio: Add optional retain-state-shutdown property
  leds: gpio: Allow LED to retain state at shutdown

 Documentation/devicetree/bindings/leds/leds-gpio.txt | 3 +++
 drivers/leds/leds-gpio.c                             | 7 ++++++-
 include/linux/leds.h                                 | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.11.0
