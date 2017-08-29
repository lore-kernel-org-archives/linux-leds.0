From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 1/1] dt-bindings: Add vendor Mellanox
Date: Tue, 29 Aug 2017 18:02:57 +0000
Message-ID: <1504029777-192637-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:55264 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751937AbdH2QFy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Aug 2017 12:05:54 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, jiri@resnulli.us, pavel@ucw.cz, gregkh@linuxfoundation.org, Vadim Pasternak <vadimp@mellanox.com>

This patch adds Mellanox vendor to vendor-prefixes.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ae09487..8730f33 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -196,6 +196,7 @@ mediatek	MediaTek Inc.
 megachips	MegaChips
 melexis	Melexis N.V.
 melfas	MELFAS Inc.
+mellanox	Mellanox Technologies
 memsic	MEMSIC Inc.
 merrii	Merrii Technology Co., Ltd.
 micrel	Micrel Inc.
-- 
2.1.4
