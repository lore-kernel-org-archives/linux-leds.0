Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA933C1D5F
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785685603; cv=none; b=YWaj4ckoPJZTemKrHyley2HV8Ccn+ny9p295mDF2jSapgQbwZk1mL998jb036uuxrwMapA6RVx63YZ6iL5v8XvH6W3EUzTEDaBzAfYCWC85OVQe2HC+RQymc1zAliU0YW+qmgIq3U6XhL+8qThg4xEp0VSdWaZbfiEeHxOYmlZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785685603; c=relaxed/simple;
	bh=OR37Iv+hKosJmgVoNOTvEX7Csyg/AuprGKf/TLFamgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fn7HNrL9iPmYTiTJSHlWclAYJ08IDIHvrntDmWx0sPhJP3SnR9h1crxWPhZzta/x1PH3V5ecny0wqiIc13JbxB7Nfdi2U+PxhpxTaCoH7bPf4Hfm5jgEF8PiuXwaDKKiCzjDU6PxMILcL7N4f9gn0qf1dcSWBz7e12DyQh/8aO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNtKBz/8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNtKBz/8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso20095885ad.3
        for <linux-leds@vger.kernel.org>; Sun, 02 Aug 2026 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785685594; x=1786290394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiJGL86YIgemNjCRQw+qQrbA3LuaeRoAxQWIwG8BtCE=;
        b=nNtKBz/8a6nyhKJA60VccdCySaQEk1emGKlDGqCf7ds7GutkvIgEVj0fAb7kWyy+SA
         hH9d5t4ogOqvmjfIcTlQMim9qjIBzYeE0b+cb9EsfcJ8K1qB5nJeDnC5g6VO9m98yC2b
         q1MB577oDC7TLmv+7J2j7symxdAvY/mE62XZlfNozTIBhAfNsPAMTHRY0vSWdzLXtirp
         bS3aIrIW/503tk+Xtcik7wBTv63CsK/FoaiEv5g5s4mUrXZ0W57HLIp6pyidnz2RYvFz
         vkViCprTmKulbtydxmcYBaDooRdxwLFcM5AfBGlUXhbMMF2lLNLjm0RD8hOR4p7m0Vst
         +QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785685594; x=1786290394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiJGL86YIgemNjCRQw+qQrbA3LuaeRoAxQWIwG8BtCE=;
        b=lSsvNfRdxx5cH2ynDNHvwh5HpJM3daeGKZXYiBlkZ/7RFk669cLzwR8u2GgVQRT1/o
         G1UuWF4a19iS8TG3A0fYVvvW/8FxAAvnhPcdUP032ndOybKtry0qsPT5Yeumkbx545LA
         KTivzEe9C3KlfePTmJBKK7PVokppukOBnowBsn7mf6nnsRrfcwTqdL1RiknalUNXdJ66
         zkhj1K4+TaR2fOoDuZuHkEL/5gF3qKwig2UgW+5Q0mScOQ25Zr2zVlFLF+5ii5rNLZUA
         mi9Uq7nnpqx5DTbX3t1CUK6UEmsbE2KbGhb5dR91go66pJ8Ccs5GBw39DP7DsC5t9gX1
         oBgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4iByvQugA/utyjZSm2QNPBNnDRzhX/oqwfhxHELDouWgMSoyLvTpvFL3NBHiiXYncss5//O9hSR1t@vger.kernel.org
X-Gm-Message-State: AOJu0YxS+p6NZHv8SEANCpoTXbhePMdLG9JgXDTBMksHNYhdqt85IYm3
	n0XzoZEBlv/4HOUnyDOaGPlATwYQLCvQi56CNH/QRU34CefSGcw1v1ub
X-Gm-Gg: AR+sD10mKqkPCkgBCh9cal3aaIO8c1PS6H41EQbnQDQtd+xk8DJxbtEGX+ozZYNClfg
	w/nrD7tCpTc2xzA9tM38zd9dSOXUwbEfjGzXpBQrsr6bdMz53IYKRl56j/YkEkvOKSVWTib+VEA
	m5b0V8BnWuDrDd7LGQI/WR279h2Krcxe3jcr7MHTHzjIzlmq6XIzIlXddwD5fwi/oOmpiw6w+5J
	BaKnF8EMJ3DUeO0/54JLwzxYAhequUkX87oydNMUAMLp6PW9SrQOiWvLmmqDAqMFDbQCLrsaQdw
	seMuD2N2IjtdQw9QHBnxH8U4Fwn8noTP3fhln0ySXgXnbvQBx29CplKRoq+A70NjoKQE97dbSaT
	OyZPt0U9r8NXIBtFkpxiINoX0Hhnxqhve4nSxtP0hvoMGXYaQR0uO4lx8V/ptlZ5z1Gc8q7yWfA
	euO8D3x7ltdNucpvZKCvqnCkJpKEm3AE9dCGFtgaXjtt3nwe052GdBn8ZXJJaCXswy/FdeoNDJ9
	705xhP031ou61Udt2+ZXd1iGG8549LB0yxA974=
X-Received: by 2002:a17:903:1b43:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2d052188a6bmr70827165ad.6.1785685594212;
        Sun, 02 Aug 2026 08:46:34 -0700 (PDT)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e29a126sm30602192eec.31.2026.08.02.08.46.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Aug 2026 08:46:33 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [RFC net-next 4/4] ptp: ocp: Add R4006 I2C peripheral topology
Date: Sun,  2 Aug 2026 08:46:20 -0700
Message-ID: <25f255ac12a006059e0a442a5d750c31e9da1ae2.1785684064.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1785684064.git.ahmadexp@gmail.com>
References: <cover.1785684064.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R4006 cards place a PCA9546 mux behind the FPGA I2C controller. The
mux exposes three LM75B temperature sensors, an SHT3x humidity sensor,
an ICP10100 pressure sensor, and an IS32FL3207 controller for the GNSS
and SMA LEDs.

Detect the board through the existing EEPROM nvmem path and describe
its per-card topology with software nodes. Instantiate the standard I2C
clients after their adapters appear, allowing the component drivers to
bind normally. Leave the channel containing the BNO08x empty because
there is no upstream driver for that device.

Serialize EEPROM discovery, retry topology population from I2C bus
notifications, and atomically disable the delayed work during teardown.
Limit the existing i2c sysfs link to the root adapter.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 485 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 459 insertions(+), 26 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 35e911f1a..b362a7c4d 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -21,10 +21,14 @@
 #include <net/devlink.h>
 #include <linux/i2c.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/property.h>
 #include <linux/crc16.h>
 #include <linux/dpll.h>
 
+#include <dt-bindings/leds/common.h>
+
 #define PCI_DEVICE_ID_META_TIMECARD		0x0400
 
 #define PCI_VENDOR_ID_CELESTICA			0x18d4
@@ -347,6 +351,32 @@ struct ptp_ocp_serial_port {
 #define OCP_SIGNAL_NUM			4
 #define OCP_FREQ_NUM			4
 
+#define OCP_R4006_MUX_CHANNELS		4
+#define OCP_R4006_SENSOR_COUNT		5
+#define OCP_R4006_LED_COUNT		5
+#define OCP_R4006_LED_COMPONENT_COUNT	(3 * OCP_R4006_LED_COUNT)
+#define OCP_R4006_NODE_COUNT		(1 + OCP_R4006_MUX_CHANNELS + \
+					 OCP_R4006_SENSOR_COUNT + 1 + \
+					 OCP_R4006_LED_COUNT + \
+					 OCP_R4006_LED_COMPONENT_COUNT)
+
+struct ptp_ocp_r4006 {
+	struct software_node mux_node;
+	struct property_entry mux_props[6];
+	struct software_node channel_nodes[OCP_R4006_MUX_CHANNELS];
+	struct property_entry channel_props[OCP_R4006_MUX_CHANNELS][4];
+	struct software_node sensor_nodes[OCP_R4006_SENSOR_COUNT];
+	struct property_entry sensor_props[OCP_R4006_SENSOR_COUNT][3];
+	struct software_node led_node;
+	struct property_entry led_props[6];
+	struct software_node led_nodes[OCP_R4006_LED_COUNT];
+	struct property_entry led_group_props[OCP_R4006_LED_COUNT][7];
+	struct software_node component_nodes[OCP_R4006_LED_COMPONENT_COUNT];
+	struct property_entry component_props[OCP_R4006_LED_COMPONENT_COUNT][4];
+	const struct software_node *node_group[OCP_R4006_NODE_COUNT + 1];
+	bool registered;
+};
+
 enum {
 	PORT_GNSS,
 	PORT_GNSS2,
@@ -403,6 +433,7 @@ struct ptp_ocp {
 	u16			fw_version;
 	u8			board_id[OCP_BOARD_ID_LEN];
 	u8			serial[OCP_SERIAL_LEN];
+	struct mutex		eeprom_lock; /* Serializes EEPROM discovery. */
 	bool			has_eeprom_data;
 	u32			pps_req_map;
 	int			flash_start;
@@ -414,6 +445,8 @@ struct ptp_ocp {
 	const struct ocp_sma_op *sma_op;
 	struct dpll_device *dpll;
 	dpll_tracker tracker;
+	struct ptp_ocp_r4006 *r4006;
+	struct delayed_work i2c_work;
 	int signals_nr;
 	int freq_in_nr;
 };
@@ -488,6 +521,71 @@ static struct ptp_ocp_eeprom_map art_eeprom_map[] = {
 	{ }
 };
 
+struct ptp_ocp_r4006_i2c_device {
+	const char *node_name;
+	const char *compatible;
+	const char *type;
+	u8 channel;
+	u8 address;
+};
+
+/* Channel 3's BNO08x at 0x4a has no upstream Linux driver, so omit it. */
+static const struct ptp_ocp_r4006_i2c_device ptp_ocp_r4006_sensors[] = {
+	{ "temperature@48", "national,lm75b", "lm75b", 0, 0x48 },
+	{ "temperature@49", "national,lm75b", "lm75b", 0, 0x49 },
+	{ "temperature@4a", "national,lm75b", "lm75b", 0, 0x4a },
+	{ "humidity@44", "sensirion,sht3x", "sht3x", 1, 0x44 },
+	{ "pressure@63", "invensense,icp10100", "icp10100", 2, 0x63 },
+};
+
+static_assert(ARRAY_SIZE(ptp_ocp_r4006_sensors) == OCP_R4006_SENSOR_COUNT);
+
+struct ptp_ocp_r4006_led {
+	const char *node_name;
+	const char *function;
+	u8 function_enumerator;
+	bool has_function_enumerator;
+	u8 channel[3];
+};
+
+static const struct ptp_ocp_r4006_led ptp_ocp_r4006_leds[] = {
+	{
+		.node_name = "multi-led@c",
+		.function = LED_FUNCTION_STATUS,
+		.channel = { 13, 12, 14 },
+	},
+	{
+		.node_name = "multi-led@6",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 1,
+		.has_function_enumerator = true,
+		.channel = { 7, 6, 8 },
+	},
+	{
+		.node_name = "multi-led@9",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 2,
+		.has_function_enumerator = true,
+		.channel = { 10, 9, 11 },
+	},
+	{
+		.node_name = "multi-led@0",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 3,
+		.has_function_enumerator = true,
+		.channel = { 1, 0, 2 },
+	},
+	{
+		.node_name = "multi-led@3",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 4,
+		.has_function_enumerator = true,
+		.channel = { 4, 3, 5 },
+	},
+};
+
+static_assert(ARRAY_SIZE(ptp_ocp_r4006_leds) == OCP_R4006_LED_COUNT);
+
 #define bp_assign_entry(bp, res, val) ({				\
 	uintptr_t addr = (uintptr_t)(bp) + (res)->bp_offset;		\
 	*(typeof(val) *)addr = val;					\
@@ -1969,6 +2067,12 @@ ptp_ocp_nvmem_device_put(struct nvmem_device **nvmemp)
 	*nvmemp = NULL;
 }
 
+static bool
+ptp_ocp_has_eeprom_data(struct ptp_ocp *bp)
+{
+	return smp_load_acquire(&bp->has_eeprom_data);
+}
+
 static void
 ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 {
@@ -1977,11 +2081,11 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 	const void *tag;
 	int ret;
 
-	if (!bp->i2c_ctrl)
-		return;
-
 	tag = NULL;
 	nvmem = NULL;
+	mutex_lock(&bp->eeprom_lock);
+	if (!bp->i2c_ctrl || ptp_ocp_has_eeprom_data(bp))
+		goto out;
 
 	for (map = bp->eeprom_map; map->len; map++) {
 		if (map->tag != tag) {
@@ -2001,10 +2105,12 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 			goto fail;
 	}
 
-	bp->has_eeprom_data = true;
+	/* Publish the EEPROM fields before readers observe valid data. */
+	smp_store_release(&bp->has_eeprom_data, true);
 
 out:
 	ptp_ocp_nvmem_device_put(&nvmem);
+	mutex_unlock(&bp->eeprom_lock);
 	return;
 
 fail:
@@ -2012,6 +2118,291 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 	goto out;
 }
 
+static int
+ptp_ocp_i2c_adapter_match(struct device *dev, const void *data)
+{
+	return !!i2c_verify_adapter(dev);
+}
+
+static struct i2c_adapter *
+ptp_ocp_i2c_root_adapter(struct ptp_ocp *bp)
+{
+	struct i2c_adapter *adapter;
+	struct device *dev;
+
+	if (!bp->i2c_ctrl)
+		return NULL;
+
+	dev = device_find_child(&bp->i2c_ctrl->dev, NULL,
+				ptp_ocp_i2c_adapter_match);
+	if (!dev)
+		return NULL;
+
+	adapter = i2c_verify_adapter(dev);
+	if (!adapter || !try_module_get(adapter->owner)) {
+		put_device(dev);
+		return NULL;
+	}
+
+	/* The device reference from device_find_child() is owned by the caller. */
+	return adapter;
+}
+
+static int
+ptp_ocp_r4006_init_nodes(struct ptp_ocp *bp)
+{
+	static const char * const channel_names[] = {
+		"i2c@0", "i2c@1", "i2c@2", "i2c@3",
+	};
+	static const char * const output_names[] = {
+		"led@0", "led@1", "led@2", "led@3", "led@4", "led@5",
+		"led@6", "led@7", "led@8", "led@9", "led@a", "led@b",
+		"led@c", "led@d", "led@e", "led@f", "led@10", "led@11",
+	};
+	static const u32 colors[] = {
+		LED_COLOR_ID_RED, LED_COLOR_ID_GREEN, LED_COLOR_ID_BLUE,
+	};
+	struct device *dev = &bp->pdev->dev;
+	struct ptp_ocp_r4006 *r4006;
+	unsigned int component = 0;
+	unsigned int node = 0;
+	unsigned int i, j, prop;
+	int ret;
+
+	if (bp->r4006)
+		return 0;
+
+	r4006 = devm_kzalloc(dev, sizeof(*r4006), GFP_KERNEL);
+	if (!r4006)
+		return -ENOMEM;
+
+	r4006->mux_node.name =
+		devm_kasprintf(dev, GFP_KERNEL, "ocp%d-r4006-mux", bp->id);
+	if (!r4006->mux_node.name)
+		return -ENOMEM;
+	r4006->mux_node.properties = r4006->mux_props;
+	r4006->mux_props[0] =
+		PROPERTY_ENTRY_STRING("compatible", "nxp,pca9546");
+	r4006->mux_props[1] = PROPERTY_ENTRY_U32("reg", 0x70);
+	r4006->mux_props[2] = PROPERTY_ENTRY_BOOL("i2c-mux-idle-disconnect");
+	r4006->mux_props[3] = PROPERTY_ENTRY_U32("#address-cells", 1);
+	r4006->mux_props[4] = PROPERTY_ENTRY_U32("#size-cells", 0);
+	r4006->node_group[node++] = &r4006->mux_node;
+
+	for (i = 0; i < OCP_R4006_MUX_CHANNELS; i++) {
+		r4006->channel_nodes[i].name = channel_names[i];
+		r4006->channel_nodes[i].parent = &r4006->mux_node;
+		r4006->channel_nodes[i].properties = r4006->channel_props[i];
+		r4006->channel_props[i][0] = PROPERTY_ENTRY_U32("reg", i);
+		r4006->channel_props[i][1] = PROPERTY_ENTRY_U32("#address-cells", 1);
+		r4006->channel_props[i][2] = PROPERTY_ENTRY_U32("#size-cells", 0);
+		r4006->node_group[node++] = &r4006->channel_nodes[i];
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ptp_ocp_r4006_sensors); i++) {
+		const struct ptp_ocp_r4006_i2c_device *sensor;
+
+		sensor = &ptp_ocp_r4006_sensors[i];
+		r4006->sensor_nodes[i].name = sensor->node_name;
+		r4006->sensor_nodes[i].parent =
+			&r4006->channel_nodes[sensor->channel];
+		r4006->sensor_nodes[i].properties = r4006->sensor_props[i];
+		r4006->sensor_props[i][0] =
+			PROPERTY_ENTRY_STRING("compatible", sensor->compatible);
+		r4006->sensor_props[i][1] =
+			PROPERTY_ENTRY_U32("reg", sensor->address);
+		r4006->node_group[node++] = &r4006->sensor_nodes[i];
+	}
+
+	r4006->led_node.name = "led-controller@34";
+	r4006->led_node.parent = &r4006->channel_nodes[1];
+	r4006->led_node.properties = r4006->led_props;
+	r4006->led_props[0] =
+		PROPERTY_ENTRY_STRING("compatible", "issi,is32fl3207");
+	r4006->led_props[1] = PROPERTY_ENTRY_U32("reg", 0x34);
+	r4006->led_props[2] = PROPERTY_ENTRY_U32("issi,riset-ohms", 4700);
+	r4006->led_props[3] = PROPERTY_ENTRY_U32("#address-cells", 1);
+	r4006->led_props[4] = PROPERTY_ENTRY_U32("#size-cells", 0);
+	r4006->node_group[node++] = &r4006->led_node;
+
+	for (i = 0; i < ARRAY_SIZE(ptp_ocp_r4006_leds); i++) {
+		const struct ptp_ocp_r4006_led *led = &ptp_ocp_r4006_leds[i];
+		u32 group_reg;
+
+		group_reg = min3(led->channel[0], led->channel[1],
+				 led->channel[2]);
+		r4006->led_nodes[i].name = led->node_name;
+		r4006->led_nodes[i].parent = &r4006->led_node;
+		r4006->led_nodes[i].properties = r4006->led_group_props[i];
+		prop = 0;
+		r4006->led_group_props[i][prop++] =
+			PROPERTY_ENTRY_U32("reg", group_reg);
+		r4006->led_group_props[i][prop++] =
+			PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB);
+		r4006->led_group_props[i][prop++] =
+			PROPERTY_ENTRY_STRING("function", led->function);
+		if (led->has_function_enumerator)
+			r4006->led_group_props[i][prop++] =
+				PROPERTY_ENTRY_U32("function-enumerator",
+						   led->function_enumerator);
+		r4006->led_group_props[i][prop++] =
+			PROPERTY_ENTRY_U32("#address-cells", 1);
+		r4006->led_group_props[i][prop] =
+			PROPERTY_ENTRY_U32("#size-cells", 0);
+		r4006->node_group[node++] = &r4006->led_nodes[i];
+
+		for (j = 0; j < ARRAY_SIZE(led->channel); j++, component++) {
+			u8 channel = led->channel[j];
+
+			r4006->component_nodes[component].name =
+				output_names[channel];
+			r4006->component_nodes[component].parent =
+				&r4006->led_nodes[i];
+			r4006->component_nodes[component].properties =
+				r4006->component_props[component];
+			r4006->component_props[component][0] =
+				PROPERTY_ENTRY_U32("reg", channel);
+			r4006->component_props[component][1] =
+				PROPERTY_ENTRY_U32("color", colors[j]);
+			r4006->component_props[component][2] =
+				PROPERTY_ENTRY_U32("led-max-microamp", 8150);
+			r4006->node_group[node++] =
+				&r4006->component_nodes[component];
+		}
+	}
+
+	if (WARN_ON(node != OCP_R4006_NODE_COUNT))
+		return -EINVAL;
+
+	ret = software_node_register_node_group(r4006->node_group);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register R4006 firmware nodes\n");
+
+	r4006->registered = true;
+	bp->r4006 = r4006;
+	return 0;
+}
+
+static int
+ptp_ocp_r4006_add_device(struct ptp_ocp *bp, struct i2c_adapter *adapter,
+			 const struct software_node *node, const char *type,
+			 u16 address)
+{
+	struct fwnode_handle *fwnode = software_node_fwnode(node);
+	struct i2c_board_info info = { };
+	struct i2c_client *client;
+
+	client = i2c_find_device_by_fwnode(fwnode);
+	if (client) {
+		put_device(&client->dev);
+		return 0;
+	}
+
+	strscpy(info.type, type, sizeof(info.type));
+	info.addr = address;
+	info.fwnode = fwnode;
+	client = i2c_new_client_device(adapter, &info);
+	if (IS_ERR(client))
+		return dev_err_probe(&bp->pdev->dev, PTR_ERR(client),
+				     "failed to add %s at %d-00%02x\n",
+				     type, i2c_adapter_id(adapter), address);
+
+	return 0;
+}
+
+static void
+ptp_ocp_r4006_populate_channel(struct ptp_ocp *bp, unsigned int channel)
+{
+	struct ptp_ocp_r4006 *r4006 = bp->r4006;
+	const struct software_node *node;
+	struct fwnode_handle *fwnode;
+	struct i2c_adapter *adapter;
+	unsigned int i;
+
+	fwnode = software_node_fwnode(&r4006->channel_nodes[channel]);
+	adapter = i2c_get_adapter_by_fwnode(fwnode);
+	if (!adapter)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(ptp_ocp_r4006_sensors); i++) {
+		const struct ptp_ocp_r4006_i2c_device *sensor;
+
+		sensor = &ptp_ocp_r4006_sensors[i];
+		if (sensor->channel != channel)
+			continue;
+
+		node = &r4006->sensor_nodes[i];
+		ptp_ocp_r4006_add_device(bp, adapter, node, sensor->type,
+					 sensor->address);
+	}
+
+	if (channel == 1)
+		ptp_ocp_r4006_add_device(bp, adapter, &r4006->led_node,
+					 "is32fl3207", 0x34);
+
+	i2c_put_adapter(adapter);
+}
+
+static void
+ptp_ocp_i2c_work(struct work_struct *work)
+{
+	struct ptp_ocp *bp = container_of(work, struct ptp_ocp, i2c_work.work);
+	const struct software_node *node;
+	struct i2c_adapter *adapter;
+	unsigned int channel;
+	int ret;
+
+	if (!bp->eeprom_map)
+		return;
+
+	adapter = ptp_ocp_i2c_root_adapter(bp);
+	if (!adapter)
+		return;
+
+	if (!ptp_ocp_has_eeprom_data(bp))
+		ptp_ocp_read_eeprom(bp);
+	if (!ptp_ocp_has_eeprom_data(bp) || memcmp(bp->board_id, "R4006", 5))
+		goto out_put_adapter;
+
+	ret = ptp_ocp_r4006_init_nodes(bp);
+	if (ret)
+		goto out_put_adapter;
+
+	node = &bp->r4006->mux_node;
+	ret = ptp_ocp_r4006_add_device(bp, adapter, node, "pca9546", 0x70);
+	if (ret)
+		goto out_put_adapter;
+
+	for (channel = 0; channel < OCP_R4006_MUX_CHANNELS; channel++)
+		ptp_ocp_r4006_populate_channel(bp, channel);
+
+out_put_adapter:
+	i2c_put_adapter(adapter);
+}
+
+static void
+ptp_ocp_r4006_unregister(struct ptp_ocp *bp)
+{
+	struct fwnode_handle *fwnode;
+	struct i2c_client *client;
+
+	disable_delayed_work_sync(&bp->i2c_work);
+	if (!bp->r4006)
+		return;
+
+	fwnode = software_node_fwnode(&bp->r4006->mux_node);
+	client = i2c_find_device_by_fwnode(fwnode);
+	if (client) {
+		i2c_unregister_device(client);
+		put_device(&client->dev);
+	}
+
+	if (bp->r4006->registered)
+		software_node_unregister_node_group(bp->r4006->node_group);
+	bp->r4006 = NULL;
+}
+
 static struct device *
 ptp_ocp_find_flash(struct ptp_ocp *bp)
 {
@@ -2166,9 +2557,9 @@ ptp_ocp_devlink_info_get(struct devlink *devlink, struct devlink_info_req *req,
 	if (err)
 		return err;
 
-	if (!bp->has_eeprom_data) {
+	if (!ptp_ocp_has_eeprom_data(bp)) {
 		ptp_ocp_read_eeprom(bp);
-		if (!bp->has_eeprom_data)
+		if (!ptp_ocp_has_eeprom_data(bp))
 			return 0;
 	}
 
@@ -3756,7 +4147,7 @@ serialnum_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct ptp_ocp *bp = dev_get_drvdata(dev);
 
-	if (!bp->has_eeprom_data)
+	if (!ptp_ocp_has_eeprom_data(bp))
 		ptp_ocp_read_eeprom(bp);
 
 	return sysfs_emit(buf, "%pM\n", bp->serial);
@@ -4727,6 +5118,7 @@ ptp_ocp_device_init(struct ptp_ocp *bp, struct pci_dev *pdev)
 
 	bp->ptp_info = ptp_ocp_clock_info;
 	spin_lock_init(&bp->lock);
+	mutex_init(&bp->eeprom_lock);
 
 	for (i = 0; i < __PORT_COUNT; i++)
 		bp->port[i].line = -1;
@@ -4865,6 +5257,7 @@ ptp_ocp_detach(struct ptp_ocp *bp)
 {
 	int i;
 
+	ptp_ocp_r4006_unregister(bp);
 	ptp_ocp_debugfs_remove_device(bp);
 	ptp_ocp_detach_sysfs(bp);
 	ptp_ocp_attr_group_del(bp);
@@ -5079,6 +5472,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_disable;
 
 	INIT_DELAYED_WORK(&bp->sync_work, ptp_ocp_sync_work);
+	INIT_DELAYED_WORK(&bp->i2c_work, ptp_ocp_i2c_work);
 
 	/* compat mode.
 	 * Older FPGA firmware only returns 2 irq's.
@@ -5096,6 +5490,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	err = ptp_ocp_register_resources(bp, id->driver_data);
 	if (err)
 		goto out;
+	mod_delayed_work(system_wq, &bp->i2c_work, 1);
 
 	bp->ptp = ptp_clock_register(&bp->ptp_info, &pdev->dev);
 	if (IS_ERR(bp->ptp)) {
@@ -5189,38 +5584,76 @@ static struct pci_driver ptp_ocp_driver = {
 	.shutdown	= ptp_ocp_remove,
 };
 
+static struct ptp_ocp *
+ptp_ocp_i2c_parent(struct device *child)
+{
+	struct device *dev = child;
+
+	while ((dev = dev->parent))
+		if (dev->driver && !strcmp(dev->driver->name, KBUILD_MODNAME))
+			return dev_get_drvdata(dev);
+
+	return NULL;
+}
+
+static bool
+ptp_ocp_i2c_is_root(struct ptp_ocp *bp, struct i2c_adapter *adapter)
+{
+	struct device *parent = adapter->dev.parent;
+
+	if (!parent)
+		return false;
+	if (bp->i2c_ctrl && parent == &bp->i2c_ctrl->dev)
+		return true;
+
+	/* The adapter can notify before ptp_ocp_register_i2c() stores it. */
+	return parent->parent == &bp->pdev->dev;
+}
+
 static int
 ptp_ocp_i2c_notifier_call(struct notifier_block *nb,
 			  unsigned long action, void *data)
 {
-	struct device *dev, *child = data;
+	struct i2c_adapter *adapter;
+	struct i2c_client *client;
+	struct device *child = data;
 	struct ptp_ocp *bp;
-	bool add;
 
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
-	case BUS_NOTIFY_DEL_DEVICE:
-		add = action == BUS_NOTIFY_ADD_DEVICE;
-		break;
-	default:
+		adapter = i2c_verify_adapter(child);
+		if (!adapter)
+			return 0;
+		bp = ptp_ocp_i2c_parent(child);
+		if (!bp)
+			return 0;
+		if (ptp_ocp_i2c_is_root(bp, adapter))
+			ptp_ocp_symlink(bp, child, "i2c");
+		mod_delayed_work(system_wq, &bp->i2c_work, 1);
 		return 0;
-	}
 
-	if (!i2c_verify_adapter(child))
+	case BUS_NOTIFY_DEL_DEVICE:
+		adapter = i2c_verify_adapter(child);
+		if (!adapter)
+			return 0;
+		bp = ptp_ocp_i2c_parent(child);
+		if (bp && ptp_ocp_i2c_is_root(bp, adapter))
+			sysfs_remove_link(&bp->dev.kobj, "i2c");
 		return 0;
 
-	dev = child;
-	while ((dev = dev->parent))
-		if (dev->driver && !strcmp(dev->driver->name, KBUILD_MODNAME))
-			goto found;
-	return 0;
+	case BUS_NOTIFY_BOUND_DRIVER:
+		client = i2c_verify_client(child);
+		if (!client || client->addr != 0x50)
+			return 0;
+		bp = ptp_ocp_i2c_parent(child);
+		if (!bp || !ptp_ocp_i2c_is_root(bp, client->adapter))
+			return 0;
+		mod_delayed_work(system_wq, &bp->i2c_work, 1);
+		return 0;
 
-found:
-	bp = dev_get_drvdata(dev);
-	if (add)
-		ptp_ocp_symlink(bp, child, "i2c");
-	else
-		sysfs_remove_link(&bp->dev.kobj, "i2c");
+	default:
+		return 0;
+	}
 
 	return 0;
 }
-- 
2.50.1 (Apple Git-155)

