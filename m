From: David Lin <dtwlin@google.com>
Subject: [PATCH 0/3] led: ledtrig-transient: add support for hrtimer
Date: Sun, 30 Apr 2017 14:36:58 -0700
Message-ID: <20170430213701.12297-1-dtwlin@google.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:32992 "EHLO
        mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1950393AbdD3VhU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2017 17:37:20 -0400
Received: by mail-pg0-f41.google.com with SMTP id y4so32761399pge.0
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2017 14:37:20 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: corbet@lwn.net, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, hdegoede@redhat.com, mark.rutland@arm.com, tony.makkiel@daqri.com, linz@li-pro.net
Cc: robh@kernel.org, romlem@google.com, joelaf@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, David Lin <dtwlin@google.com>

Hi,

These patch series add the LED_BRIGHTNESS_FAST flag support for
ledtrig-transient to use hrtimer so that platforms with high-resolution timer
support can have better accuracy in the trigger duration timing. The need for
this support is driven by the fact that Android has removed the timed_ouput [1]
and is now using led-trigger for handling vibrator control which requires the
timer to be accurate up to a millisecond. However, this flag support would also
allow hrtimer to co-exist with the ktimer without causing warning to the
existing drivers [2].

David

[1] https://patchwork.kernel.org/patch/8664831/
[2] https://lkml.org/lkml/2015/4/28/260

David Lin (3):
  leds: Replace flags bit shift with BIT() macros
  leds: Add the LED_BRIGHTNESS_FAST flag
  led: ledtrig-transient: add support for hrtimer

 Documentation/leds/leds-class.txt        |  5 +++
 drivers/leds/trigger/ledtrig-transient.c | 59 +++++++++++++++++++++++++++++---
 include/linux/leds.h                     | 13 +++----
 3 files changed, 66 insertions(+), 11 deletions(-)

-- 
2.13.0.rc0.306.g87b477812d-goog
