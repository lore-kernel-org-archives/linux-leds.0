From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 0/5] leds: trigger: Add pattern initialization from Device Tree
Date: Wed, 12 Dec 2018 12:16:41 +0100
Message-ID: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

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

 Documentation/devicetree/bindings/leds/common.txt | 36 +++++++++++++++++++++++
 drivers/leds/led-class.c                          | 25 ++++++++++++++++
 drivers/leds/trigger/ledtrig-oneshot.c            | 31 +++++++++++++++++--
 drivers/leds/trigger/ledtrig-pattern.c            | 25 ++++++++++++++++
 drivers/leds/trigger/ledtrig-timer.c              | 28 ++++++++++++++++++
 include/linux/leds.h                              |  3 ++
 6 files changed, 146 insertions(+), 2 deletions(-)

-- 
2.7.4
