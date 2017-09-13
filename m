From: David Lin <dtwlin@google.com>
Subject: [PATCH v2 0/3] led: ledtrig-transient: add support for hrtimer
Date: Wed, 13 Sep 2017 10:53:57 -0700
Message-ID: <20170913175400.42744-1-dtwlin@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: corbet@lwn.net, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, hdegoede@redhat.com, gregkh@linuxfoundation.org
Cc: robh@kernel.org, romlem@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, David Lin <dtwlin@google.com>
List-Id: linux-leds@vger.kernel.org

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

Changes from v1 to v2:
- Convert all the bit shifting flag in leds.h to use the BIT macro.
- Removed inline modifiers for the timer helper function.

David Lin (3):
  leds: Replace flags bit shift with BIT() macros
  leds: Add the LED_BRIGHTNESS_FAST flag
  led: ledtrig-transient: add support for hrtimer

 Documentation/leds/leds-class.txt        |  5 +++
 drivers/leds/trigger/ledtrig-transient.c | 59 +++++++++++++++++++++++++++++---
 include/linux/leds.h                     | 19 +++++-----
 3 files changed, 69 insertions(+), 14 deletions(-)

-- 
2.14.1.581.gf28d330327-goog
