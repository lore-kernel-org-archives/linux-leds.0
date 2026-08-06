Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78470471CFD;
	Thu,  6 Aug 2026 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017122; cv=none; b=L9MK9j1Bkq5Fwf8nvuZm7k2fXOrmD/USQDuFRVp85xRTDbT0C1KutGz77/sOosm0DMLS6tzn1yuniBfLZgqNoeE0rZbtuFUIr+wtU2W21R1QhZbTHgtyv/2N5qS9RVsiBmhx0DnPBfNCp5WDkLWgIO+7oFEuqAWcgPm9ecPvakc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017122; c=relaxed/simple;
	bh=TiJMTMUHjPSAfROyUf65UUymAYZ02Qs6VRyzM4yPh9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g6WICW4wOp7o+yihAsBiGM/bSeVza8aQsy6+DHlGNJ1d3uN1MLSwEP702SYSCDHNpleOgLNQB9cP2bi2UzwV+SQykUN+Zv7JM14ISPGzDfY38cX9XmZkLXuOGKVmmfhT8d9uswO6bCj7W9ShnfGZd2mr6inwD6HGHJLUbfo4Drc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Jq8DUJSL; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Jq8DUJSL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=uqv+mrP8Ih5H0FcUO8lgBBibpYOxH5w9lokVzK1aH1g=; t=1786017120; x=1787226720; 
	b=Jq8DUJSLgyNFeVW/jMi8g9NxE/Vp4BaoHmKo4Vgfl7OePDDo1ldlEwZJ3J3ebUSBb+Clf4oIYqV
	st/nwn306fGjo3+Hq1pwMNsND61yHJvQepXJ/pq9fCGGKghnsI/wIQuZn+pSBka+NFCEBaq+MA58O
	SgHMJXCvX5oEfSpCw7mxYyZvCooQ/GFJPACSCiHnunHjjGX5sVdH/nIpLGloMUwtH+tnAuTUVx/rS
	tTKAqLHno/gdCc7fmo5ZNOVz/UiZiDniC8hFlhM5ZOOBquPmvhiMaoerB9O/UVWoJOU9c6ilGtU8j
	IhuStWcpo6lfyeikTVrBteI8fjxxd5BDa3Kg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 06 Aug 2026 13:51:36 +0200
Subject: [PATCH v4] leds: is31fl319x: Modernize registration
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-led-modern-v4-1-eed715baab2e@kemnade.info>
X-B4-Tracking: v=1; b=H4sIAEd1dGoC/23NTQ6CMBCG4auQrq2ZDoSCK+9hXFRmKlUppkWiM
 dzdogt/4vJL5nnnLiIHx1GssrsIPLroep9GschE0xq/Z+kobYGAJWhAeWKSXU8cvKQCNRMoZat
 cJHAObN31GdtsXztedgduhrkwX7QuDn24Pb+Nar77Gx6VVNIUxiLXxlAJ6yN33hAvnbe9mNsjf
 ur8S2PSBJoIqOSmtH90/tYVFF86TxprrRGYG1X/6mmaHuJohHQ1AQAA
X-Change-ID: 20260702-led-modern-d427ed011f83
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, hns@goldelico.com, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5367; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=TiJMTMUHjPSAfROyUf65UUymAYZ02Qs6VRyzM4yPh9k=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFklpYFtjUZdAXN1QjZy2/757218SP8oo9eBp6Vbf5/YI
 CLO9dS/o5SFQYyLQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgIkIuDP8ZLS14bKduPjRBKmg
 FdPYOO5L35qTMHGhw6mqnKRtDkeSchgZOtOf3il/c+/BrIi2I09Zd5081rJ4zn1uKTbOV7+eLpe
 ewQAA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Use _ext version to have properties parsed to avoid needing to parse
them in the driver itself. More modern properties are recognized and
the leds can be referenced via phandle.
Due to the maximum current mechanics, leds are not registered right
in the first iteration over the nodes.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v4:
- capitalize description
- Link to v3: https://patch.msgid.link/20260804-led-modern-v3-1-297720eec19f@kemnade.info

Changes in v3:
- fix typo (Sashiko)
- check availability of device match data (Sashiko)
- Link to v2: https://patch.msgid.link/20260703-led-modern-v2-1-d07dd0d6ec6f@kemnade.info

Changes in v2:
- put node free action after cdef is initialized (Sashiko)
- Link to v1: https://patch.msgid.link/20260702-led-modern-v1-1-a4af2e9aad60@kemnade.info

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/leds/leds-is31fl319x.c | 61 +++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 80f38dba0fba..83cb769d8cb4 100644
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
 
@@ -363,31 +363,17 @@ static const struct of_device_id of_is31fl319x_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_is31fl319x_match);
 
-static int is31fl319x_parse_child_fw(const struct device *dev,
-				     const struct fwnode_handle *child,
-				     struct is31fl319x_led *led,
-				     struct is31fl319x_chip *is31)
+static void is31_free_fwnode(void *data)
 {
-	struct led_classdev *cdev = &led->cdev;
-	int ret;
-
-	if (fwnode_property_read_string(child, "label", &cdev->name))
-		cdev->name = fwnode_get_name(child);
+	struct is31fl319x_chip *is31 = data;
+	int i;
 
-	ret = fwnode_property_read_string(child, "linux,default-trigger", &cdev->default_trigger);
-	if (ret < 0 && ret != -EINVAL) /* is optional */
-		return ret;
+	for (i = 0; i < is31->cdef->num_leds; i++) {
+		if (is31->leds[i].fwnode)
+			fwnode_handle_put(is31->leds[i].fwnode);
 
-	led->max_microamp = is31->cdef->current_default;
-	ret = fwnode_property_read_u32(child, "led-max-microamp", &led->max_microamp);
-	if (!ret) {
-		if (led->max_microamp < is31->cdef->current_min)
-			return -EINVAL;	/* not supported */
-		led->max_microamp = min(led->max_microamp,
-					is31->cdef->current_max);
+		is31->leds[i].fwnode = NULL;
 	}
-
-	return 0;
 }
 
 static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
@@ -402,6 +388,12 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 				     "Failed to get shutdown gpio\n");
 
 	is31->cdef = device_get_match_data(dev);
+	if (!is31->cdef)
+		return -ENODEV;
+
+	ret = devm_add_action_or_reset(dev, is31_free_fwnode, is31);
+	if (ret)
+		return ret;
 
 	count = 0;
 	device_for_each_child_node_scoped(dev, child)
@@ -427,14 +419,20 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 
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
+				return dev_err_probe(dev, -EINVAL, "invalid maximum current\n");
+
+			led->max_microamp = min(led->max_microamp,
+						is31->cdef->current_max);
+		}
 
-		led->configured = true;
+		led->fwnode = fwnode_handle_get(child);
 	}
 
 	is31->audio_gain_db = 0;
@@ -531,7 +529,7 @@ static int is31fl319x_probe(struct i2c_client *client)
 	 */
 	aggregated_led_microamp = is31->cdef->current_max;
 	for (i = 0; i < is31->cdef->num_leds; i++)
-		if (is31->leds[i].configured &&
+		if (is31->leds[i].fwnode &&
 		    is31->leds[i].max_microamp < aggregated_led_microamp)
 			aggregated_led_microamp = is31->leds[i].max_microamp;
 
@@ -545,14 +543,17 @@ static int is31fl319x_probe(struct i2c_client *client)
 
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

