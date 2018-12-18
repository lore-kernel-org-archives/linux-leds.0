From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 0/5] leds: trigger: Add pattern initialization from Device Tree
Date: Tue, 18 Dec 2018 16:27:27 +0100
Message-ID: <1545146852-32207-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Raphael Teysseyre <rteysseyre@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

Changes since v3:
1. Add missing EXPORT_SYMBOL_GPL.
2. Put pattern trigger format into common file - shared between
   dt-bindings and sysfs.
3. Use array of integers as led-pattern property (since it is bigger change
   I did not add Pavel's ack to patch 2/5).
4. Mention ms units for led-pattern bindings.

Changes since v2:
1. Drop Jacek's patches and my "led: triggers: Initialize
   LED_INIT_DEFAULT_TRIGGER if trigger is brought after class".
2. Follow Rob's advices about bindings - use "led-pattern" property
   and generalize usage of it into to three triggers.
3. New patches (2/5, 4/5 and 5/5).

Changes since v1:
1. Rebase on Jacek's patches.
2. Add patch 3/5 for fixup of Jacek's solution.
3. Drop first two patches from the series (applied).
4. Patch 5/5: Use LED_INIT_DEFAULT_TRIGGER (suggested by Jacek Anaszewski).
5. Patch 5/5: Return-on-error and log warning (suggested by Pavel Machek).


Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  dt-bindings: leds: Add pattern initialization from Device Tree
  leds: Add helper for getting default pattern from Device Tree
  leds: trigger: pattern: Add pattern initialization from Device Tree
  leds: trigger: oneshot: Add initialization from Device Tree
  leds: trigger: timer: Add initialization from Device Tree

 .../ABI/testing/sysfs-class-led-trigger-pattern    | 51 +----------
 Documentation/devicetree/bindings/leds/common.txt  | 11 +++
 .../bindings/leds/leds-trigger-pattern.txt         | 48 +++++++++++
 drivers/leds/led-class.c                           | 42 +++++++++
 drivers/leds/trigger/ledtrig-oneshot.c             | 38 ++++++++-
 drivers/leds/trigger/ledtrig-pattern.c             | 99 +++++++++++++++++-----
 drivers/leds/trigger/ledtrig-timer.c               | 34 ++++++++
 include/linux/leds.h                               |  3 +
 8 files changed, 257 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt

-- 
2.7.4
