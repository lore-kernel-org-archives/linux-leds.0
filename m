Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2FF31D730
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 20:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230951; cv=none; b=kGao9ygwc1qH6CVOb8yFNJdImyeMF7OAcJMoK6ocWrrPF6N5d0V37E71h9CGDEmCQNNUk0Gp7TP6/OEHADn0EjDnWO5cT80oe8TFV2aiMAkaXn5w4qRa/IFsVEcE3bwVzwwBNp0T1qhoUIPE8Phtiz0mIaakb4jqe2lz7j1SQhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230951; c=relaxed/simple;
	bh=DGyHWHzEDdVKWmRcyLbSrbOSBJs/krJ4FIbFkXaTmjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0htiG2xlFOFp8QTXG7F6DgBcof2yDeIqGgCiHjA8/+Z0mgqpmCXUyHWUgyCaqdE14Fnakd8qPynbezjzZzhoWEjfJKSeWbZ9hVXcKZS9e1q1cCmSUOi98U5Wkcptl0IW9tlwAYM+vodez3TPrQpMfOv2PvtjjDH2Hw1+hJ1cNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECARQtzr; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECARQtzr"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2bfc2540cso6884335ad.3
        for <linux-leds@vger.kernel.org>; Mon, 05 Oct 2026 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791230949; x=1791835749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKvgwHyZG+OMRGAdlmS6VkXWRFQgcIDm6fEeM834xHo=;
        b=ECARQtzrRkcTp1cYgnuf66cv+HSHTd9zViDoOdfSf1V50RxIaRRsKkBmceJ+hLBBmt
         6KR1t148VojzWNjvh3rGLQcu4v3w5YNOIwB6p8SMCYvZmg1NYcoJU0WvJHlZt5o/WuqZ
         2aeSXVFBnfrZ/raerBuufJgy9jP5ugcPv4UMApeU3ksB5mkO2S2wDlLMjFlvx+C8nzMZ
         ZE14IrfnIvlgSmBDfHSpG9KEgFCc4G4FB08uN2uXOKWH3wHn/FtCrJMqVwdS+95AVejV
         wPPlsiAogWsZgsm8L54Mk6E8RTJy8PdTfPmeIc/EDSnQApDaIhxtJZfswVTLd6sApz/8
         oBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791230949; x=1791835749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKvgwHyZG+OMRGAdlmS6VkXWRFQgcIDm6fEeM834xHo=;
        b=vi2mUOiJs/Nsa6KSyVw9HKXYhTnXYGBjjVoKMw3sqhcvztSWyQnOgrn0FSx1n7l3LS
         NhDigGIu8LHGHh8M7U93mSuoStTXgvUMHoGfViC44JN9TvjKbBUncWmbhk0yTacwJQDP
         pu6Z7jmvFpgUJ/675RSDVzevkPgVcKBqLRYKvVVeNABFUHXmFF48NeDai27a1qLBd1gJ
         9oTaOkZgmjIrWeFmI1s8hAwZTjzxP92HyMxursM6pTu3h41L63VvoUMyPQubi64EocY0
         JMtVWAyl9k2naVWXU9XTF7K/A27j1L5FCmP0ykA8Na7tU8s8+hIfwW46CMsI7L1+OeJw
         o+2w==
X-Gm-Message-State: AFq9FYJ3ltObNi/nLC+H/Mk3P1hB8fiVHlNgWGfk/0lFltcysUyZQ4iN
	aTLFtb+TuirLklUvxRLrwwy8RbN9O8IFBXP6siPnJhUy820Lxsf775/giNXm2jRveaE=
X-Gm-Gg: AYBFou0PN9Rrxmhjc+u1eIvil5DJZXwr2OfGMnTi7C3RfjM8dvH89EwwrJiXC772Zgn
	QfnOJs7x2lsk3KwwLKFc3EhqQaX+jtgwGgkqZi8wM4KbPSh6oYlq2A6ih7hGm9zqpp7PzQhypSg
	sTmQf3jk8OVxB216tQK8COHEZwVeiIqkUrKXT51WgALbWm6hK9Wx2vjwIjl+L95AMCh/j4Wl8tE
	kJu6Wu/AGy6HI8UOaev9/51QPHJtCBOfocoX09l2O9Xumdgjvoym1+j8OduyqOTIuQO3bJObrRy
	YEqj2au1QMpc+ormcX0WOUfqIzN/bcLvWPB8u0rM9V4v064EgLcRuHrJ5V4jSQxMlAYnrlnMTuw
	KyDOone5IoPWt4qaYJjLtfkexw/DjnIfDKq8CSYpW8XpXIqueRIqXNrvcUgU4cOJeaRYIr0KnuF
	RPhFa657F5BUyxcvfuZkSJgtZBdwXb0dtmX34EjKKKYztD+77BdJqsGnp3+phLJnF6pt5c4KMM0
	aOENQ+F1Hn9RYGLHwB37J49+VfTv0qRzJRNfxU377b1TU4RV4a8nkKOgPb04gnoLb7WfiXYoTvw
	Xzjm+fEK96d6j7WXKcFbyakpTzHWjhnRgIovZNq4avlqYLvT
X-Received: by 2002:a17:902:e543:b0:2e4:beef:9039 with SMTP id d9443c01a7336-2e4beef95c7mr96936815ad.1.1791230948704;
        Mon, 05 Oct 2026 13:09:08 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae51asm12516895ad.29.2026.10.05.13.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:09:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] leds: pca955x: drop platform data and allocate LEDs with the device
Date: Mon,  5 Oct 2026 13:09:06 -0700
Message-ID: <20261005200906.188636-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct pca955x_platform_data has been private to this driver since
commit ed1f4b9676a8 ("leds: pca955x: add device tree support"), so
nothing can pass it in through dev_get_platdata() and it only serves
as an intermediate copy of the per-LED type, default state and fwnode.
That copy is a full array of struct pca955x_led, the same runtime
structure that struct pca955x already holds, so the data is stored
twice.

Remove the platform data and parse the child firmware nodes directly
into pca955x->leds[]. Make leds[] a flexible array member so it is
allocated together with struct pca955x. This removes three
allocations and the num_leds sanity check, which could no longer
fail.

struct pca955x_led moves above struct pca955x, as a flexible array
member needs the complete element type.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove platform_data.
 drivers/leds/leds-pca955x.c | 94 ++++++++++++-------------------------
 1 file changed, 31 insertions(+), 63 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 273383351ba0..e4af7a3b639f 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -79,6 +79,17 @@ struct pca955x_chipdef {
 	int			blink_div;	/* PSC divider */
 };
 
+struct pca955x_led {
+	struct pca955x	*pca955x;
+	struct led_classdev	led_cdev;
+	int			led_num;	/* 0 .. 15 potentially */
+	u32			type;
+	enum led_default_state	default_state;
+	struct fwnode_handle	*fwnode;
+};
+
+#define led_to_pca955x(l)	container_of(l, struct pca955x_led, led_cdev)
+
 static const struct pca955x_chipdef pca955x_chipdefs[] = {
 	[pca9550] = {
 		.bits		= 2,
@@ -114,7 +125,6 @@ static const struct pca955x_chipdef pca955x_chipdefs[] = {
 
 struct pca955x {
 	struct mutex lock;
-	struct pca955x_led *leds;
 	const struct pca955x_chipdef	*chipdef;
 	struct i2c_client	*client;
 	unsigned long active_blink;
@@ -123,22 +133,7 @@ struct pca955x {
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	struct gpio_chip gpio;
 #endif
-};
-
-struct pca955x_led {
-	struct pca955x	*pca955x;
-	struct led_classdev	led_cdev;
-	int			led_num;	/* 0 .. 15 potentially */
-	u32			type;
-	enum led_default_state	default_state;
-	struct fwnode_handle	*fwnode;
-};
-
-#define led_to_pca955x(l)	container_of(l, struct pca955x_led, led_cdev)
-
-struct pca955x_platform_data {
-	struct pca955x_led	*leds;
-	int			num_leds;
+	struct pca955x_led leds[];
 };
 
 /* 8 bits per input register */
@@ -530,37 +525,27 @@ static int pca955x_gpio_direction_output(struct gpio_chip *gc,
 }
 #endif /* CONFIG_LEDS_PCA955X_GPIO */
 
-static struct pca955x_platform_data *
-pca955x_get_pdata(struct i2c_client *client, const struct pca955x_chipdef *chip)
+static int pca955x_parse_fwnode(struct pca955x *pca955x)
 {
-	struct pca955x_platform_data *pdata;
+	struct device *dev = &pca955x->client->dev;
+	u8 bits = pca955x->chipdef->bits;
 	struct pca955x_led *led;
 	struct fwnode_handle *child;
 	int count;
 
-	count = device_get_child_node_count(&client->dev);
-	if (count > chip->bits)
-		return ERR_PTR(-ENODEV);
-
-	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	pdata->leds = devm_kcalloc(&client->dev,
-				   chip->bits, sizeof(struct pca955x_led),
-				   GFP_KERNEL);
-	if (!pdata->leds)
-		return ERR_PTR(-ENOMEM);
+	count = device_get_child_node_count(dev);
+	if (count > bits)
+		return -ENODEV;
 
-	device_for_each_child_node(&client->dev, child) {
+	device_for_each_child_node(dev, child) {
 		u32 reg;
 		int res;
 
 		res = fwnode_property_read_u32(child, "reg", &reg);
-		if ((res != 0) || (reg >= chip->bits))
+		if ((res != 0) || (reg >= bits))
 			continue;
 
-		led = &pdata->leds[reg];
+		led = &pca955x->leds[reg];
 		led->type = PCA955X_TYPE_LED;
 		led->fwnode = child;
 		led->default_state = led_init_default_state_get(child);
@@ -568,9 +553,7 @@ pca955x_get_pdata(struct i2c_client *client, const struct pca955x_chipdef *chip)
 		fwnode_property_read_u32(child, "type", &led->type);
 	}
 
-	pdata->num_leds = chip->bits;
-
-	return pdata;
+	return 0;
 }
 
 static int pca955x_probe(struct i2c_client *client)
@@ -584,7 +567,6 @@ static int pca955x_probe(struct i2c_client *client)
 	u8 i, nls, psc0;
 	u8 ls1[4];
 	u8 ls2[4];
-	struct pca955x_platform_data *pdata;
 	bool keep_psc0 = false;
 	bool set_default_label = false;
 	char default_label[4];
@@ -595,12 +577,6 @@ static int pca955x_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV, "unknown chip\n");
 
 	adapter = client->adapter;
-	pdata = dev_get_platdata(&client->dev);
-	if (!pdata) {
-		pdata =	pca955x_get_pdata(client, chip);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	}
 
 	/* Make sure the slave address / chip type combo given is possible */
 	if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
@@ -616,22 +592,11 @@ static int pca955x_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
-	if (pdata->num_leds != chip->bits) {
-		dev_err(&client->dev,
-			"board info claims %d LEDs on a %u-bit chip\n",
-			pdata->num_leds, chip->bits);
-		return -ENODEV;
-	}
-
-	pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
+	pca955x = devm_kzalloc(&client->dev,
+			       struct_size(pca955x, leds, chip->bits), GFP_KERNEL);
 	if (!pca955x)
 		return -ENOMEM;
 
-	pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
-				     sizeof(*pca955x_led), GFP_KERNEL);
-	if (!pca955x->leds)
-		return -ENOMEM;
-
 	i2c_set_clientdata(client, pca955x);
 
 	mutex_init(&pca955x->lock);
@@ -639,6 +604,10 @@ static int pca955x_probe(struct i2c_client *client)
 	pca955x->chipdef = chip;
 	pca955x->blink_period = PCA955X_BLINK_DEFAULT_MS;
 
+	err = pca955x_parse_fwnode(pca955x);
+	if (err)
+		return err;
+
 	init_data.devname_mandatory = false;
 	init_data.devicename = "pca955x";
 
@@ -657,7 +626,6 @@ static int pca955x_probe(struct i2c_client *client)
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
 		pca955x_led->pca955x = pca955x;
-		pca955x_led->type = pdata->leds[i].type;
 
 		switch (pca955x_led->type) {
 		case PCA955X_TYPE_NONE:
@@ -671,16 +639,16 @@ static int pca955x_probe(struct i2c_client *client)
 			led->brightness_get = pca955x_led_get;
 			led->blink_set = pca955x_led_blink;
 
-			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF)
+			if (pca955x_led->default_state == LEDS_DEFSTATE_OFF)
 				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_OFF);
-			else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON)
+			else if (pca955x_led->default_state == LEDS_DEFSTATE_ON)
 				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
 			else if (pca955x_ledstate(ls2[reg], bit) == PCA955X_LS_BLINK0) {
 				keep_psc0 = true;
 				set_bit(i, &pca955x->active_blink);
 			}
 
-			init_data.fwnode = pdata->leds[i].fwnode;
+			init_data.fwnode = pca955x_led->fwnode;
 
 			if (is_of_node(init_data.fwnode)) {
 				if (to_of_node(init_data.fwnode)->name[0] ==
-- 
2.56.0

