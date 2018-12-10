From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 0/5] leds: trigger: Add pattern initialization from Device Tree
Date: Mon, 10 Dec 2018 10:29:56 +0100
Message-ID: <1544434201-14190-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

I rebased on top of Jacek's patches and, as I could not find them on git kernel
tree, I included them here. Also with small fixup.

Changes since v1:
1. Rebase on Jacek's patches.
2. Add patch 3/5 for fixup of Jacek's solution.
3. Drop first two patches from the series (applied).
4. Patch 5/5: Use LED_INIT_DEFAULT_TRIGGER (suggested by Jacek Anaszewski).
5. Patch 5/5: Return-on-error and log warning (suggested by Pavel Machek).


Best regards,
Krzysztof


Jacek Anaszewski (2):
  led: triggers: Break the for loop after default trigger is found
  led: triggers: Add LED_INIT_DEFAULT_TRIGGER flag

Krzysztof Kozlowski (3):
  led: triggers: Initialize LED_INIT_DEFAULT_TRIGGER if trigger is
    brought after class
  dt-bindings: leds: Add pattern initialization from Device Tree
  leds: trigger: Add pattern initialization from Device Tree

 Documentation/devicetree/bindings/leds/common.txt |  7 +++++
 drivers/leds/led-triggers.c                       | 10 +++++--
 drivers/leds/trigger/ledtrig-pattern.c            | 32 +++++++++++++++++++++++
 include/linux/leds.h                              |  1 +
 4 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.7.4
