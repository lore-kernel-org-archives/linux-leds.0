From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 1/3] of: Add vendor prefix for Si-En Technology
Date: Sun, 31 Jan 2016 12:59:14 +0000
Message-ID: <1454245156-15747-2-git-send-email-stefan.wahren@i2se.com>
References: <1454245156-15747-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:49685 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755623AbcAaM7s (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 31 Jan 2016 07:59:48 -0500
In-Reply-To: <1454245156-15747-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>

Si-En Technology is a fabless design house which offers
audio amplifiers, LED drivers and sensors.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 72e2c5a..52f22f9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -204,6 +204,7 @@ seagate	Seagate Technology PLC
 semtech	Semtech Corporation
 sgx	SGX Sensortech
 sharp	Sharp Corporation
+si-en	Si-En Technology Ltd.
 sigma	Sigma Designs, Inc.
 sil	Silicon Image
 silabs	Silicon Laboratories
-- 
1.7.9.5
