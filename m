From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 2/2] led: is31fl32xx: define complete i2c_device_id table
Date: Mon, 18 Jul 2016 18:39:35 +0200
Message-ID: <63517786a4e0c68808fdc41592b1bfe870b1e849.1468859975.git.hns@goldelico.com>
References: <cover.1468859975.git.hns@goldelico.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162]:44166 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455AbcGRQju (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jul 2016 12:39:50 -0400
In-Reply-To: <cover.1468859975.git.hns@goldelico.com>
In-Reply-To: <cover.1468859975.git.hns@goldelico.com>
References: <cover.1468859975.git.hns@goldelico.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, drivshin.allworx@gmail.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>

Otherwise the driver module will not be automatically probed.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-is31fl32xx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index a53b71e..478844c 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -482,10 +482,16 @@ static int is31fl32xx_remove(struct i2c_client *client)
 }
 
 /*
- * i2c-core requires that id_table be non-NULL, even though
- * it is not used for DeviceTree based instantiation.
+ * i2c-core (and modalias) requires that id_table be properly filled,
+ * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
+	{ "is31fl3236" },
+	{ "is31fl3235" },
+	{ "is31fl3218" },
+	{ "sn3218" },
+	{ "is31fl3216" },
+	{ "sn3216" },
 	{},
 };
 
-- 
2.7.3
