From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v9 1/3] of: Add vendor prefix for Kinetic technologies
Date: Tue, 12 May 2015 17:37:55 +0900
Message-ID: <1431419877-28339-2-git-send-email-ingi2.kim@samsung.com>
References: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34488 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932434AbbELIiW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 04:38:22 -0400
In-reply-to: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>

This patch adds vendor prefix for Kinetic technologies

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
Reviewed-by: Varka Bhadram <varkabhadram@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b6682ab..0a50533 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -108,6 +108,7 @@ isee	ISEE 2007 S.L.
 isil	Intersil
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
+kinetic Kinetic Technologies
 lacie	LaCie
 lantiq	Lantiq Semiconductor
 lenovo	Lenovo Group Ltd.
-- 
2.0.5
