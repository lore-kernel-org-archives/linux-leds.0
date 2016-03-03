From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: [PATCH 1/4] DT: Add vendor prefix for Integrated Silicon Solutions Inc.
Date: Wed,  2 Mar 2016 22:01:32 -0500
Message-ID: <1456974095-1867-2-git-send-email-drivshin.allworx@gmail.com>
References: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: David Rivshin <drivshin@allworx.com>

ISSI is the stock ticker Integrated Silicon Solutions Inc.
Company website: http://www.issi.com

Signed-off-by: David Rivshin <drivshin@allworx.com>
---

Changes from RFC:
 none

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
