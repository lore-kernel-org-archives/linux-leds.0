From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: [PATCH v2 1/4] DT: Add vendor prefix for Integrated Silicon Solutions Inc.
Date: Mon,  7 Mar 2016 19:57:13 -0500
Message-ID: <1457398636-6485-2-git-send-email-drivshin.allworx@gmail.com>
References: <1457398636-6485-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f67.google.com ([209.85.192.67]:34500 "EHLO
	mail-qg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752248AbcCHBBh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2016 20:01:37 -0500
In-Reply-To: <1457398636-6485-1-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org

From: David Rivshin <drivshin@allworx.com>

ISSI is the stock ticker Integrated Silicon Solutions Inc.
Company website: http://www.issi.com

Signed-off-by: David Rivshin <drivshin@allworx.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes from v1:
 - added Rob's ack [1]

Changes from RFC:
 none

[1] https://lkml.org/lkml/2016/3/4/961

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
