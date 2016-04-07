From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 0/1] leds: pca9532: Add device tree binding
Date: Thu,  7 Apr 2016 15:22:51 +0800
Message-ID: <1460013772-129968-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:53469 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755192AbcDGHXD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Apr 2016 03:23:03 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, riku.voipio@iki.fi, rpurdie@rpsys.net, j.anaszewski@samsung.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

This patch adds very basic device tree binding support to the
pca9532 driver. Sufficent to load driver and enable LEDs.

Changes for v2:
- Fixup device tree documentation
- Use label propert and fall back to node name,
- Call of_node_put when breaking loop iterating leds.
- Increment the loop counter.
- Add initial state and default-trigger.


Phil Reid (1):
  leds: pca9532: Add device tree binding

 .../devicetree/bindings/leds/leds-pca9532.txt      | 42 +++++++++++++
 drivers/leds/leds-pca9532.c                        | 69 ++++++++++++++++++++--
 include/dt-bindings/leds/leds-pca9532.h            | 23 ++++++++
 include/linux/leds-pca9532.h                       | 18 ++----
 4 files changed, 135 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
 create mode 100644 include/dt-bindings/leds/leds-pca9532.h

-- 
1.8.3.1
