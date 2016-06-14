From: Phil Reid <preid@electromag.com.au>
Subject: [Patch v6 0/1] leds: pca9532: Add device tree binding
Date: Tue, 14 Jun 2016 15:36:16 +0800
Message-ID: <1465889777-42390-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:38355 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751475AbcFNHg0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Tue, 14 Jun 2016 03:36:26 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, riku.voipio@iki.fi, rpurdie@rpsys.net, j.anaszewski@samsung.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

This patch adds very basic device tree binding support to the
pca9532 driver. Sufficent to load driver and enable LEDs.

Change for v6:
- Address warning on 64bit builds by casting to unitptr_t and then int.

Changes for v5:
- Address warning on 64bit builds. Change devid cast to unitptr_t.
- Make pca9532_of_populate_pdata static.

Changes for v4:
- Reference leds/common.txt in documentation.
- Check return value of of_match_device()

Changes for v3:
- Remove state from device tree binding.
  This needs more thought on how to configure which PWM is used.
  And is not essential for a first pass.

Changes for v2:
- Fixup device tree documentation
- Use label propert and fall back to node name,
- Call of_node_put when breaking loop iterating leds.
- Increment the loop counter.
- Add initial state and default-trigger.

Phil Reid (1):
  leds: pca9532: Add device tree binding

 .../devicetree/bindings/leds/leds-pca9532.txt      | 39 +++++++++++
 drivers/leds/leds-pca9532.c                        | 75 ++++++++++++++++++++--
 include/dt-bindings/leds/leds-pca9532.h            | 18 ++++++
 include/linux/leds-pca9532.h                       |  9 ++-
 4 files changed, 132 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
 create mode 100644 include/dt-bindings/leds/leds-pca9532.h

-- 
1.8.3.1
