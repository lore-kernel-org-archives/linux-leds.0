From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v2 1/3] of: Add vendor prefix for Kinetic technologies
Date: Tue, 17 Mar 2015 17:45:49 +0900
Message-ID: <1426581951-11869-2-git-send-email-ingi2.kim@samsung.com>
References: <1426581951-11869-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1426581951-11869-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds vendor prefix for Kinetic technologies

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389ca13..de9e126 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -98,6 +98,7 @@ isee	ISEE 2007 S.L.
 isil	Intersil
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
+kinetic Kinetic Technologies
 lacie	LaCie
 lantiq	Lantiq Semiconductor
 lenovo	Lenovo Group Ltd.
-- 
2.0.5
