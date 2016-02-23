From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: [PATCH RFC 0/3] leds: Add driver for the ISSI IS31FL32xx family of LED drivers
Date: Tue, 23 Feb 2016 13:17:22 -0500
Message-ID: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f66.google.com ([209.85.192.66]:34421 "EHLO
	mail-qg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754201AbcBWSSa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 13:18:30 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

From: David Rivshin <drivshin@allworx.com>

This series adds support for the ISSI IS31FL32xx family of I2C LED
drivers. I'm posting this first as an RFC as there are a couple of
items I'd especially like feedback on:

In the binding, I choose to have 'reg' be 1-based in order to follow
the hardware documentation. It seems 0-based is the normal choice.

In the binding, I used the 'reg' property for the LED channel, as
it seemed ePAPR required that name. I also considered naming the
property 'chan', and not pretending that it represented a bus
address at all.

In the binding, max-brightness is an optional property. In other
bindings it seems to be either unsupported, or required.

If there is a problem with the devicetree for an LED subnode, I
ignore that one node and continue on with the rest. I could see
an argument for just bailing on the whole probe if any subnode is
bad.

I left the LED enable bit always enabled, and just let the PWM be
set to 0 for "off" naturally.

I did not see a need to use regmap, as there was never a need for
read/modify/write. In the case of the 3218/3216 This was facilitated
by the above choice.

I did not see for a mutex to protect any of the data, as it was
read-only after probing, and I2C core already has a mutex to protect
the device.

I implemented support for all 4 devices in a single driver mainly
because I really need is31fl3236 support, but I had access to an
is31fl3216 eval board early, and could get a lot of milage out of it.
The other two parts were similar enough to one of those that it was
trivial include them as well (although untested).
    - The 3236 and 3235 are nearly identical (differing just in
      number of channels and some register addresses).
    - The 3218 is like the 3236/3235, except it packs the enable
      bits into 3 registers, doesn't support per-channel
      max-current divisor, and lacks a global control register.
    - The 3216 has the most differences. It has some additional
      register differences, and goes on to supports a number
      of (relatively) complex extra features:
        - using some channels as GPIOs
        - HW animation of LEDs
        - HW modulation of LEDs according to an audio input
I could certainly see an argument for having the 3236/3235 driver be
separate from the other devices. I'm not sure where the desired
balance between duplicate code (mostly in probing) vs simpler drivers.
For reference, I think about 70 lines (15%) are unique to the 3216,
and another 20 (5%) unique to the 3218.

I should also mention that I just noticed the is31fl3218 and
is31fl3216 appear to be the same devices as the SI-EN SN3218 and
SN3216. ISSI acquired SI-EN in 2011, and seems to have just rebranded
those devices. Either this driver or the recently-added SN3218 driver
should work for both the ISSI and SN "3218" parts.
Obviously we don't need both implementations, though I have no
preference for which one to use. For instance, I'd have no argument
with just adding a compatible entry for is31fl3218 to the sn3218
driver (since that's trivial), remove the 3216/3218 support from
this driver, and call it a day. I suspect that anyone actually using
the 3216 in product would need some of the advanced functions that
I did not implement anyways.

David Rivshin (3):
  DT: Add vendor prefix for Integrated Silicon Solutions Inc.
  DT: leds: Add binding for the ISSI IS31FL32xx family of LED drivers
  leds: Add driver for the ISSI IS31FL32xx family of LED drivers

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  51 +++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/leds/Kconfig                               |   9 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-is31fl32xx.c                     | 442 +++++++++++++++++++++
 5 files changed, 504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
 create mode 100644 drivers/leds/leds-is31fl32xx.c

-- 
2.5.0
