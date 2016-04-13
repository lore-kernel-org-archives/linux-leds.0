From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 0/3] Extend the LED panic trigger
Date: Wed, 13 Apr 2016 15:08:16 -0300
Message-ID: <1460570899-24642-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:34863 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754124AbcDMSIi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Apr 2016 14:08:38 -0400
Received: by mail-qg0-f41.google.com with SMTP id f105so49380328qge.2
        for <linux-leds@vger.kernel.org>; Wed, 13 Apr 2016 11:08:38 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

As per commit 916fe619951f ("leds: trigger: Introduce a kernel
panic LED trigger"), the kernel now supports a new LED trigger
to hook on the panic blink.

However, the only way of using this is to dedicate a LED device
to this function.

To overcome this limitation, the present series introduces the
capability to switch the LED trigger of certain LED devices upon
a kernel panic (using the panic notifier).

The decision of which LEDs should be switched to the panic trigger
is left to each LED device driver. As an example, a devicetree
boolean property is introduced and used in the leds-gpio driver.

Feedback and other ideas on how to implement this are most welcomed.

Changes from v1:

  * Dropped the led_trigger_event_nosleep API, and instead just
    clear the blink_delay_{on, off} when the panic is notified. 
    This results in less changes.

  * Changed the flag to LED_PANIC_INDICATOR, as requested by Jacek.

  * Changed the firmware property name to "panic-indicator", as
    requested by Jacek. 

Ezequiel Garcia (3):
  leds: triggers: Allow to switch the trigger to "panic" on a kernel
    panic
  devicetree: leds: Introduce "panic-indicator" optional property
  leds: gpio: Support the "panic-indicator" firmware property

 Documentation/devicetree/bindings/leds/common.txt |  3 ++
 drivers/leds/led-triggers.c                       | 57 +++++++++++++++++++++++
 drivers/leds/leds-gpio.c                          |  4 ++
 include/linux/leds.h                              |  2 +
 4 files changed, 66 insertions(+)

-- 
2.7.0
