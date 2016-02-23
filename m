From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: [PATCH RFC 1/3] DT: Add vendor prefix for Integrated Silicon Solutions Inc.
Date: Tue, 23 Feb 2016 13:17:23 -0500
Message-ID: <1456251445-23970-2-git-send-email-drivshin.allworx@gmail.com>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f65.google.com ([209.85.192.65]:33514 "EHLO
	mail-qg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754478AbcBWSSd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 13:18:33 -0500
In-Reply-To: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

From: David Rivshin <drivshin@allworx.com>

ISSI is the stock ticker Integrated Silicon Solutions Inc.
Company website: http://www.issi.com

Signed-off-by: David Rivshin <drivshin@allworx.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 52f22f9..dd72e05 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -120,6 +120,7 @@ intercontrol	Inter Control Group
 invensense	InvenSense Inc.
 isee	ISEE 2007 S.L.
 isil	Intersil
+issi	Integrated Silicon Solutions Inc.
 jedec	JEDEC Solid State Technology Association
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
-- 
2.5.0
