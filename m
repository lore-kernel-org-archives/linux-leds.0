From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v7 1/3] of: Add vendor prefix for Kinetic technologies
Date: Thu, 23 Apr 2015 22:18:03 +0900
Message-ID: <1429795085-22171-2-git-send-email-ingi2.kim@samsung.com>
References: <1429795085-22171-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1429795085-22171-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds vendor prefix for Kinetic technologies

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index fae26d0..90a4be1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -100,6 +100,7 @@ isee	ISEE 2007 S.L.
 isil	Intersil
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
+kinetic Kinetic Technologies
 lacie	LaCie
 lantiq	Lantiq Semiconductor
 lenovo	Lenovo Group Ltd.
-- 
2.0.5
