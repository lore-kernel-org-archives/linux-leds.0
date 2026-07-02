Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CC47DD45;
	Thu,  2 Jul 2026 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994233; cv=none; b=n9etNQYY3RntoE0XhDjRqKOjXn8PtYXHg8UJCBgabxXHKrWnXNCv9Lry2LKwS7OnN/Tk18/Ctv0Prall53S8FZTo0+pqEOXWRHTigQU9GsTCcWt4iZ5KsSLtu4FOEuWxqJE+xQPIsjJqoZcCshrerXum3PdA6LCrwnMN3d8VtTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994233; c=relaxed/simple;
	bh=5Q9L/V9sh4fJQb6lROe4DQiPLDCS0YEuFJXZ1yvCeZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mpd2JheF9Astg/7feM6kErg3UgfjXaw6uTdPU3t8rHJ5QIO5eEWc9UNlS5uBYlv2Nza9ZEpi1LTKAoo5lKyKp2PFcNs5b+ij6ojLshKWXhYUXAuuGNxKMF5JNyP9tpeoGfERSDdvauFhCTFHEJr9hWffNcszXXnw/w5AV2wTpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=oKBKGvDB; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="oKBKGvDB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=BEOVO3lYWb2snM7ViujTn+qyEtFn3fRFviYDJydQ8Yw=; t=1782994229; x=1784203829; 
	b=oKBKGvDBq6jotijmQgZ7qoIC2ck80jygAVTOA8ai12Achn/3yNeCFeysCmOShbElKS8882E3sZY
	re9cwJAP/10Xxvgg7Tc3QliUVY+51YpUmnxrwitEhE9sMmcIltjkbdawm+t7Zws/G7reTiUmY4QSB
	uWFfvgyC5eXGAGrkLBAHWDHGRMpoBllIwypmTlCLKtJeRHyZ54m+IEQDolaonzD4NlSzZAU0+WzRI
	A7isyztc3E9tsy1u0exkacZc42cnm4lfa7HEFdduHnZyacnBWjiDN9HwqpYRZ0MUKFjDsLLtNKYq3
	A3Xe1I/0H+3i++I6xz0dqUaOaRYT04jM/udw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 02 Jul 2026 14:10:06 +0200
Subject: [PATCH] leds: is31fl319x: modernize registration
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-led-modern-v1-1-a4af2e9aad60@kemnade.info>
X-B4-Tracking: v=1; b=H4sIAB1VRmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwMj3ZzUFN3c/JTUojzdFBMj89QUA0PDNAtjJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaACNkZvNuAAAA
X-Change-ID: 20260702-led-modern-d427ed011f83
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, hns@goldelico.com, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4927; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=5Q9L/V9sh4fJQb6lROe4DQiPLDCS0YEuFJXZ1yvCeZU=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFluoVqyb2Ye6Oo2MymNO5eSq5ZbWPq1/73Og5yi82I2X
 Ze3/kvrKGVhEONikBVTZPllreD2SeVZbvDUCHuYOaxMIEMYuDgFYCLl1xkZDhcWZRkJHU59mzjZ
 VGrDqoUZRtNmSV68q8Cxo8gxZeqkBQz/i7OMPDy+T7HMybG9q7ZnMs8PX2fVF/PMYrTf/jaW22r
 OCgA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Use _ext version to have properties parsed to avoid needing to parse
them in the driver itself. More modern properties are recognized and
the leds can be referenced via phandle.
Due to the maximum current mechanics, leds are not registered right
in the first iteration over the nodes.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/leds/leds-is31fl319x.c | 71 +++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 80f38dba0fba..e5cca596fe7c 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -98,7 +98,7 @@ struct is31fl319x_chip {
 		struct is31fl319x_chip  *chip;
 		struct led_classdev     cdev;
 		u32                     max_microamp;
-		bool                    configured;
+		struct fwnode_handle *fwnode;
 	} leds[IS31FL319X_MAX_LEDS];
 };
 
@@ -363,33 +363,6 @@ static const struct of_device_id of_is31fl319x_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_is31fl319x_match);
 
-static int is31fl319x_parse_child_fw(const struct device *dev,
-				     const struct fwnode_handle *child,
-				     struct is31fl319x_led *led,
-				     struct is31fl319x_chip *is31)
-{
-	struct led_classdev *cdev = &led->cdev;
-	int ret;
-
-	if (fwnode_property_read_string(child, "label", &cdev->name))
-		cdev->name = fwnode_get_name(child);
-
-	ret = fwnode_property_read_string(child, "linux,default-trigger", &cdev->default_trigger);
-	if (ret < 0 && ret != -EINVAL) /* is optional */
-		return ret;
-
-	led->max_microamp = is31->cdef->current_default;
-	ret = fwnode_property_read_u32(child, "led-max-microamp", &led->max_microamp);
-	if (!ret) {
-		if (led->max_microamp < is31->cdef->current_min)
-			return -EINVAL;	/* not supported */
-		led->max_microamp = min(led->max_microamp,
-					is31->cdef->current_max);
-	}
-
-	return 0;
-}
-
 static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
@@ -427,14 +400,20 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 
 		led = &is31->leds[reg - 1];
 
-		if (led->configured)
+		if (led->fwnode)
 			return dev_err_probe(dev, -EINVAL, "led %u is already configured\n", reg);
 
-		ret = is31fl319x_parse_child_fw(dev, child, led, is31);
-		if (ret)
-			return dev_err_probe(dev, ret, "led %u DT parsing failed\n", reg);
+		led->max_microamp = is31->cdef->current_default;
+		ret = fwnode_property_read_u32(child, "led-max-microamp", &led->max_microamp);
+		if (!ret) {
+			if (led->max_microamp < is31->cdef->current_min)
+				return dev_err_probe(dev, -EINVAL, "invalid maximum corrunt\n");
+
+			led->max_microamp = min(led->max_microamp,
+						is31->cdef->current_max);
+		}
 
-		led->configured = true;
+		led->fwnode = fwnode_handle_get(child);
 	}
 
 	is31->audio_gain_db = 0;
@@ -483,6 +462,19 @@ static inline int is31fl3196_db_to_gain(u32 dezibel)
 	return dezibel / IS31FL3196_AUDIO_GAIN_DB_STEP;
 }
 
+static void is31_free_fwnode(void *data)
+{
+	struct is31fl319x_chip *is31 = data;
+	int i;
+
+	for (i = 0; i < is31->cdef->num_leds; i++) {
+		if (is31->leds[i].fwnode)
+			fwnode_handle_put(is31->leds[i].fwnode);
+
+		is31->leds[i].fwnode = NULL;
+	}
+}
+
 static int is31fl319x_probe(struct i2c_client *client)
 {
 	struct is31fl319x_chip *is31;
@@ -498,6 +490,10 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (!is31)
 		return -ENOMEM;
 
+	err = devm_add_action_or_reset(dev, is31_free_fwnode, is31);
+	if (err)
+		return err;
+
 	err = devm_mutex_init(dev, &is31->lock);
 	if (err)
 		return err;
@@ -531,7 +527,7 @@ static int is31fl319x_probe(struct i2c_client *client)
 	 */
 	aggregated_led_microamp = is31->cdef->current_max;
 	for (i = 0; i < is31->cdef->num_leds; i++)
-		if (is31->leds[i].configured &&
+		if (is31->leds[i].fwnode &&
 		    is31->leds[i].max_microamp < aggregated_led_microamp)
 			aggregated_led_microamp = is31->leds[i].max_microamp;
 
@@ -545,14 +541,17 @@ static int is31fl319x_probe(struct i2c_client *client)
 
 	for (i = 0; i < is31->cdef->num_leds; i++) {
 		struct is31fl319x_led *led = &is31->leds[i];
+		struct led_init_data init_data = {};
 
-		if (!led->configured)
+		if (!led->fwnode)
 			continue;
 
+		init_data.fwnode = led->fwnode;
+
 		led->chip = is31;
 		led->cdev.brightness_set_blocking = is31->cdef->brightness_set;
 
-		err = devm_led_classdev_register(&client->dev, &led->cdev);
+		err = devm_led_classdev_register_ext(&client->dev, &led->cdev, &init_data);
 		if (err < 0)
 			return err;
 	}

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260702-led-modern-d427ed011f83

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

