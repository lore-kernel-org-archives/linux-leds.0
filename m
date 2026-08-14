Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579673E2AD7
	for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 23:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749089; cv=none; b=jljqsdDddRFVH45T9ANVlaS0R7R1SpDe7+9219N3MlZNTtBXzbMPhY7OTsVdA7LDNBoVBKDBRq1TLc9xV6WweG7hikXnmpVCi0RV7rF4Yj9D6VRTXh0g4ILWO5I9dzxw8SN75q2Vl7HKC9i2SuvkLJ8BHwV4I67SxC8g0ho/FRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749089; c=relaxed/simple;
	bh=U5tu6TCgfJTzwMdBVa0p0omZBfcc7LqNpP9Vb5gPnKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fg7rPiZhuOjxWLiTrirEwxejrR+YN8gn7E1pr2w7WUbEjnASgVwTjyJDF0Bv2Mil+UJQAGSOtC0AhH1ylzPSshPXNVrLztcs+aVbpe5SlccFxqNZH2cyFl8wRe8vBLlfBrzVUG2svklUGW4rIbSIJU3zDJbO+rpkKAR3HXm5bwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVvT0UUi; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVvT0UUi"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caed617615so21741655ad.3
        for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 16:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786749085; x=1787353885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mzeBMG1OiYWjiftyE04kMKTcsbLkUEV53Apw3PiquE=;
        b=LVvT0UUioRLORgX3r/4EseFW3NONbSsDf0eJI7AvkG6Dol66NONUW2g7tK1LcPySjR
         aclA6XoU5nSLs5FZm+Ybj/5SCu7sMv5nWySP/kUy6jTpqdMZU0WYm6hdlnzKS/xdfWpW
         Mr0YTDUAxxy2thYiXyeQoH8HhnEpWT8XdhAvrIo42UlwQ9NNFcTPrXHnHoC/7sLIWjdd
         f8ekElpXI2FamiBr8BJqVzELm3v6a2yZQ1VDeRatiRkknTAGDP7hwFfpFau4w8Pb5A6S
         51ZUUrfqFZUswFrG2FEl58GUQbH90iz8/hQBT/sReiISudxPUSjfh7IKJVmzakDZtNpI
         FPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786749085; x=1787353885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mzeBMG1OiYWjiftyE04kMKTcsbLkUEV53Apw3PiquE=;
        b=Q9k1Y5r3bTzjB5kjYaY5tAwEMnq0UleyY6gxrL6AGJtHiSj1shRhvg5vUfmNCQWrgM
         FFWfKnMol1NIDP4aAoE1u1mGfr4xDPnCCe0/2E1SfT1HK9h6jTWsBUXbtnWVw4dP/me8
         xs/qDPryyllOUgeLXRMxbeGitJZ9+0RyBGbRZCaXreUO67VxfVmzvy7YR9yHAshQF+Ww
         YCmD0aMlkiLI9MaAwLbcn/+bMoqbhjTthmL8d28VU8Z+jxRPTw10Q+45zcaW4uQBjFr1
         D4+XeKgbnz26mNBjIulrvRvrY+h/vBHFJ5sZjkSrbyl95UKcov2oNdJ36nWnnZlC7OH0
         VkDw==
X-Forwarded-Encrypted: i=1; AHgh+RrUa+X5eNckapMkwB0ldgCjaYs7kGgQCAWwP9tn/9bWO9MRuyS07LQd6PrZQL5J/eayNlaS/gKun0ET@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCoJH4htPrMWuQ+8DeMVCccs3vAvm5cwoztDq7o6DE8z5Dgz5
	D3P8ViYanPQOWpI/LXiwBLvrQ+wXZpjXoeekidY7EZYrwZQFz8TifJ5N
X-Gm-Gg: AR+sD11nyYZzt+fq7Dp1Ea/bdmRUFFWOkZooWkd8QxZDzKCMXm7i9OkIWBgmMn42+GM
	MKMo/QSexFu77Lvwx5HL3AlXzCbvaqOYH/xpJNKf+IJ52/gq8UcMX6mQNA2VOY2H+a/ZCQZuiTb
	bvSmUCv50KZ0IKhYEKvqQ5WmZtkONlHVG+7ojN0B6UgZlyiwG7+0J6OjEhSLplbliqO7fEa4jUi
	Gl+XkRKmf4iQUYxn7sqwH9kVXOaPZjH5q+vKlC0v5HddrERSBEElA0e1BAwYqGNV35bNs1gsCuU
	Husggxd8odq1Q5e57EVKD8hH33C1Ln73/emdPqHcTsH+SYWCegBguwQ3L0qCxHgMv5ud3Gjeyyx
	hU2XXOB4vuWp7DmODqhZm3S8ajqI0FcYozFSYNdBPnDjQlmZ8xz8NJIYDIBx89fhNHIS9rU0zlc
	g1OlOWaloLLaT1bA3/Fa5eoR7JEWbQMFd0EMk89spc2E4DUhLuq0g/Ggnjov3rdmbVQ2ltz+qIB
	GFeEg==
X-Received: by 2002:a05:6a21:339a:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3cc7200c614mr10187444637.26.1786749085392;
        Fri, 14 Aug 2026 16:11:25 -0700 (PDT)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1568sm8563607eec.11.2026.08.14.16.11.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 16:11:24 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v5 5/7] ptp: ocp: Add profile-driven I2C topology support
Date: Fri, 14 Aug 2026 16:10:53 -0700
Message-ID: <f3570bdde36b104f5d0309f4f6514c76c44a5e92.1786747084.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786746757.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Time Card variants route board peripherals through a PCA9546 mux,
but their peripheral layout depends on the physical board revision.

Add reusable software-node construction and client population helpers.
Use per-device I2C notifications and serialized delayed work to wait for
the root adapter, instantiate a selected profile, and retry dependencies
that are not ready yet.

Stop the work and remove the mux from a platform-bus unbind notifier
before the controller driver deletes its root adapter. This prevents a
new client from being created after i2c_del_adapter() has swept the
adapter children. Board profiles are added separately.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 718 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 681 insertions(+), 37 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 31a4c9dfe391..444b26a5e2a9 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -23,9 +23,12 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/property.h>
 #include <linux/crc16.h>
 #include <linux/dpll.h>
 
+#include <dt-bindings/leds/common.h>
+
 #define PCI_DEVICE_ID_META_TIMECARD		0x0400
 
 #define PCI_VENDOR_ID_CELESTICA			0x18d4
@@ -352,6 +355,70 @@ struct ptp_ocp_serial_port {
 #define OCP_SIGNAL_NUM			4
 #define OCP_FREQ_NUM			4
 
+#define OCP_I2C_MUX_CHANNELS		4
+#define OCP_I2C_MAX_SENSOR_COUNT	5
+#define OCP_I2C_MAX_LED_COUNT		6
+#define OCP_I2C_MAX_LED_COMPONENT_COUNT	(3 * OCP_I2C_MAX_LED_COUNT)
+#define OCP_I2C_MUX_NAME_LEN		32
+#define OCP_I2C_MUX_COMPATIBLE		"nxp,pca9546"
+#define OCP_I2C_MUX_TYPE		"pca9546"
+#define OCP_I2C_MUX_ADDRESS		0x70
+#define OCP_I2C_RETRY_MAX		10
+#define OCP_I2C_RECOVERY_SECS		30
+#define OCP_I2C_MAX_NODE_COUNT		(1 + OCP_I2C_MUX_CHANNELS + \
+					 OCP_I2C_MAX_SENSOR_COUNT + 1 + \
+					 OCP_I2C_MAX_LED_COUNT + \
+					 OCP_I2C_MAX_LED_COMPONENT_COUNT)
+
+struct ptp_ocp_i2c_device {
+	const char *node_name;
+	const char *compatible;
+	const char *type;
+	u8 channel;
+	u8 address;
+};
+
+struct ptp_ocp_led {
+	const char *node_name;
+	const char *function;
+	u8 function_enumerator;
+	bool has_function_enumerator;
+	u8 channel[3];
+};
+
+struct ptp_ocp_i2c_profile {
+	const char *name;
+	const struct ptp_ocp_i2c_device *sensors;
+	unsigned int sensor_count;
+	const struct ptp_ocp_led *leds;
+	unsigned int led_count;
+	const char *led_node_name;
+	u8 led_mux_channel;
+	u8 led_address;
+	u32 led_riset_ohms;
+	u32 led_max_microamp;
+};
+
+struct ptp_ocp_i2c_topology {
+	char mux_name[OCP_I2C_MUX_NAME_LEN];
+	struct software_node mux_node;
+	struct property_entry mux_props[6];
+	struct software_node channel_nodes[OCP_I2C_MUX_CHANNELS];
+	struct property_entry channel_props[OCP_I2C_MUX_CHANNELS][4];
+	struct software_node sensor_nodes[OCP_I2C_MAX_SENSOR_COUNT];
+	struct property_entry sensor_props[OCP_I2C_MAX_SENSOR_COUNT][3];
+	struct software_node led_node;
+	struct property_entry led_props[6];
+	struct software_node led_nodes[OCP_I2C_MAX_LED_COUNT];
+	struct property_entry led_group_props[OCP_I2C_MAX_LED_COUNT][7];
+	struct software_node component_nodes[OCP_I2C_MAX_LED_COMPONENT_COUNT];
+	struct property_entry
+		component_props[OCP_I2C_MAX_LED_COMPONENT_COUNT][4];
+	const struct software_node *node_group[OCP_I2C_MAX_NODE_COUNT + 1];
+	const struct ptp_ocp_i2c_profile *profile;
+	bool registered;
+};
+
 enum {
 	PORT_GNSS,
 	PORT_GNSS2,
@@ -422,6 +489,17 @@ struct ptp_ocp {
 	const struct ocp_sma_op *sma_op;
 	struct dpll_device *dpll;
 	dpll_tracker tracker;
+	const struct ptp_ocp_i2c_profile *i2c_profile;
+	struct ptp_ocp_i2c_topology *i2c_topology;
+	struct mutex i2c_topology_lock; /* Serializes topology updates. */
+	struct delayed_work i2c_work;
+	struct notifier_block i2c_notifier;
+	struct notifier_block i2c_ctrl_notifier;
+	unsigned int i2c_retry_count;
+	bool i2c_root_present;
+	bool i2c_resources_ready;
+	bool i2c_notifier_registered;
+	bool i2c_ctrl_notifier_registered;
 	int signals_nr;
 	int freq_in_nr;
 };
@@ -452,6 +530,10 @@ static int ptp_ocp_signal_from_perout(struct ptp_ocp *bp, int gen,
 				      struct ptp_perout_request *req);
 static int ptp_ocp_signal_enable(void *priv, u32 req, bool enable);
 static int ptp_ocp_sma_store(struct ptp_ocp *bp, const char *buf, int sma_nr);
+static int ptp_ocp_i2c_notifier_call(struct notifier_block *nb,
+				     unsigned long action, void *data);
+static int ptp_ocp_i2c_ctrl_notifier_call(struct notifier_block *nb,
+					  unsigned long action, void *data);
 
 static int ptp_ocp_art_board_init(struct ptp_ocp *bp, struct ocp_resource *r);
 
@@ -1998,7 +2080,7 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp, unsigned int fields)
 		fields &= ~OCP_EEPROM_SERIAL;
 	if (!fields)
 		goto out;
-	if (!bp->i2c_ctrl || !bp->eeprom_map) {
+	if (!READ_ONCE(bp->i2c_ctrl) || !bp->eeprom_map) {
 		ret = -ENODEV;
 		goto out;
 	}
@@ -2059,6 +2141,465 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp, unsigned int fields)
 	return ret;
 }
 
+static int
+ptp_ocp_i2c_adapter_match(struct device *dev, const void *data)
+{
+	return !!i2c_verify_adapter(dev);
+}
+
+static struct i2c_adapter *
+ptp_ocp_i2c_root_adapter(struct platform_device *i2c_ctrl)
+{
+	struct i2c_adapter *adapter;
+	struct device *dev;
+
+	dev = device_find_child(&i2c_ctrl->dev, NULL,
+				ptp_ocp_i2c_adapter_match);
+	if (!dev)
+		return NULL;
+
+	adapter = to_i2c_adapter(dev);
+	if (!try_module_get(adapter->owner)) {
+		put_device(dev);
+		return NULL;
+	}
+
+	/* The caller owns the reference returned by device_find_child(). */
+	return adapter;
+}
+
+static bool
+ptp_ocp_i2c_supported(struct ptp_ocp *bp)
+{
+	/* PCI IDs identify FPGA images, not a unique PCB revision. */
+	return (bp->pdev->vendor == PCI_VENDOR_ID_META &&
+		bp->pdev->device == PCI_DEVICE_ID_META_TIMECARD) ||
+	       (bp->pdev->vendor == PCI_VENDOR_ID_CELESTICA &&
+		bp->pdev->device == PCI_DEVICE_ID_CELESTICA_TIMECARD);
+}
+
+static int
+ptp_ocp_i2c_init_nodes(struct ptp_ocp *bp)
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
+	const struct ptp_ocp_i2c_profile *profile = bp->i2c_profile;
+	struct device *dev = &bp->pdev->dev;
+	struct ptp_ocp_i2c_topology *topology;
+	unsigned int component = 0;
+	unsigned int node = 0;
+	unsigned int expected_nodes;
+	unsigned int i, j, prop;
+	int ret;
+
+	if (!profile)
+		return -EINVAL;
+	if (bp->i2c_topology && bp->i2c_topology->registered)
+		return 0;
+	if (bp->i2c_topology) {
+		topology = bp->i2c_topology;
+		goto register_nodes;
+	}
+	if (profile->sensor_count > OCP_I2C_MAX_SENSOR_COUNT ||
+	    profile->led_count > OCP_I2C_MAX_LED_COUNT ||
+	    profile->led_mux_channel >= OCP_I2C_MUX_CHANNELS)
+		return -EINVAL;
+
+	for (i = 0; i < profile->sensor_count; i++)
+		if (profile->sensors[i].channel >= OCP_I2C_MUX_CHANNELS)
+			return -EINVAL;
+
+	for (i = 0; i < profile->led_count; i++)
+		for (j = 0; j < ARRAY_SIZE(profile->leds[i].channel); j++)
+			if (profile->leds[i].channel[j] >=
+			    ARRAY_SIZE(output_names))
+				return -EINVAL;
+
+	topology = devm_kzalloc(dev, sizeof(*topology), GFP_KERNEL);
+	if (!topology)
+		return -ENOMEM;
+
+	topology->profile = profile;
+	snprintf(topology->mux_name, sizeof(topology->mux_name),
+		 "ocp%d-%s-mux", bp->id, profile->name);
+	topology->mux_node.name = topology->mux_name;
+	topology->mux_node.properties = topology->mux_props;
+	topology->mux_props[0] =
+		PROPERTY_ENTRY_STRING("compatible", OCP_I2C_MUX_COMPATIBLE);
+	topology->mux_props[1] =
+		PROPERTY_ENTRY_U32("reg", OCP_I2C_MUX_ADDRESS);
+	topology->mux_props[2] =
+		PROPERTY_ENTRY_BOOL("i2c-mux-idle-disconnect");
+	topology->mux_props[3] = PROPERTY_ENTRY_U32("#address-cells", 1);
+	topology->mux_props[4] = PROPERTY_ENTRY_U32("#size-cells", 0);
+	topology->node_group[node++] = &topology->mux_node;
+
+	for (i = 0; i < OCP_I2C_MUX_CHANNELS; i++) {
+		topology->channel_nodes[i].name = channel_names[i];
+		topology->channel_nodes[i].parent = &topology->mux_node;
+		topology->channel_nodes[i].properties =
+			topology->channel_props[i];
+		topology->channel_props[i][0] = PROPERTY_ENTRY_U32("reg", i);
+		topology->channel_props[i][1] =
+			PROPERTY_ENTRY_U32("#address-cells", 1);
+		topology->channel_props[i][2] =
+			PROPERTY_ENTRY_U32("#size-cells", 0);
+		topology->node_group[node++] = &topology->channel_nodes[i];
+	}
+
+	for (i = 0; i < profile->sensor_count; i++) {
+		const struct ptp_ocp_i2c_device *sensor;
+
+		sensor = &profile->sensors[i];
+		topology->sensor_nodes[i].name = sensor->node_name;
+		topology->sensor_nodes[i].parent =
+			&topology->channel_nodes[sensor->channel];
+		topology->sensor_nodes[i].properties =
+			topology->sensor_props[i];
+		prop = 0;
+		if (sensor->compatible)
+			topology->sensor_props[i][prop++] =
+				PROPERTY_ENTRY_STRING("compatible",
+						      sensor->compatible);
+		topology->sensor_props[i][prop] =
+			PROPERTY_ENTRY_U32("reg", sensor->address);
+		topology->node_group[node++] = &topology->sensor_nodes[i];
+	}
+
+	topology->led_node.name = profile->led_node_name;
+	topology->led_node.parent =
+		&topology->channel_nodes[profile->led_mux_channel];
+	topology->led_node.properties = topology->led_props;
+	topology->led_props[0] =
+		PROPERTY_ENTRY_STRING("compatible", "issi,is32fl3207");
+	topology->led_props[1] =
+		PROPERTY_ENTRY_U32("reg", profile->led_address);
+	topology->led_props[2] =
+		PROPERTY_ENTRY_U32("issi,riset-ohms",
+				   profile->led_riset_ohms);
+	topology->led_props[3] = PROPERTY_ENTRY_U32("#address-cells", 1);
+	topology->led_props[4] = PROPERTY_ENTRY_U32("#size-cells", 0);
+	topology->node_group[node++] = &topology->led_node;
+
+	for (i = 0; i < profile->led_count; i++) {
+		const struct ptp_ocp_led *led = &profile->leds[i];
+		u32 group_reg;
+
+		group_reg = min3(led->channel[0], led->channel[1],
+				 led->channel[2]);
+		topology->led_nodes[i].name = led->node_name;
+		topology->led_nodes[i].parent = &topology->led_node;
+		topology->led_nodes[i].properties =
+			topology->led_group_props[i];
+		prop = 0;
+		topology->led_group_props[i][prop++] =
+			PROPERTY_ENTRY_U32("reg", group_reg);
+		topology->led_group_props[i][prop++] =
+			PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB);
+		topology->led_group_props[i][prop++] =
+			PROPERTY_ENTRY_STRING("function", led->function);
+		if (led->has_function_enumerator)
+			topology->led_group_props[i][prop++] =
+				PROPERTY_ENTRY_U32("function-enumerator",
+						   led->function_enumerator);
+		topology->led_group_props[i][prop++] =
+			PROPERTY_ENTRY_U32("#address-cells", 1);
+		topology->led_group_props[i][prop] =
+			PROPERTY_ENTRY_U32("#size-cells", 0);
+		topology->node_group[node++] = &topology->led_nodes[i];
+
+		for (j = 0; j < ARRAY_SIZE(led->channel); j++, component++) {
+			u8 channel = led->channel[j];
+
+			topology->component_nodes[component].name =
+				output_names[channel];
+			topology->component_nodes[component].parent =
+				&topology->led_nodes[i];
+			topology->component_nodes[component].properties =
+				topology->component_props[component];
+			topology->component_props[component][0] =
+				PROPERTY_ENTRY_U32("reg", channel);
+			topology->component_props[component][1] =
+				PROPERTY_ENTRY_U32("color", colors[j]);
+			topology->component_props[component][2] =
+				PROPERTY_ENTRY_U32("led-max-microamp",
+						   profile->led_max_microamp);
+			topology->node_group[node++] =
+				&topology->component_nodes[component];
+		}
+	}
+
+	expected_nodes = 1 + OCP_I2C_MUX_CHANNELS +
+		profile->sensor_count + 1 + profile->led_count +
+		3 * profile->led_count;
+	if (WARN_ON(node != expected_nodes)) {
+		devm_kfree(dev, topology);
+		return -EINVAL;
+	}
+
+	bp->i2c_topology = topology;
+
+register_nodes:
+	ret = software_node_register_node_group(topology->node_group);
+	if (ret)
+		return ret;
+
+	topology->registered = true;
+	return 0;
+}
+
+static int
+ptp_ocp_i2c_add_device(struct i2c_adapter *adapter,
+		       const struct software_node *node,
+		       const char *type, u16 address)
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
+		return PTR_ERR(client);
+
+	return 0;
+}
+
+static int
+ptp_ocp_i2c_populate_channel(struct ptp_ocp *bp, unsigned int channel)
+{
+	struct ptp_ocp_i2c_topology *topology = bp->i2c_topology;
+	const struct ptp_ocp_i2c_profile *profile = topology->profile;
+	const struct software_node *node;
+	struct fwnode_handle *fwnode;
+	struct i2c_adapter *adapter;
+	unsigned int i;
+	int err, ret = 0;
+
+	fwnode = software_node_fwnode(&topology->channel_nodes[channel]);
+	adapter = i2c_get_adapter_by_fwnode(fwnode);
+	if (!adapter)
+		return -EAGAIN;
+
+	for (i = 0; i < profile->sensor_count; i++) {
+		const struct ptp_ocp_i2c_device *sensor;
+
+		sensor = &profile->sensors[i];
+		if (sensor->channel != channel)
+			continue;
+
+		node = &topology->sensor_nodes[i];
+		err = ptp_ocp_i2c_add_device(adapter, node, sensor->type,
+					     sensor->address);
+		if (err && !ret)
+			ret = err;
+	}
+
+	if (channel == profile->led_mux_channel) {
+		err = ptp_ocp_i2c_add_device(adapter, &topology->led_node,
+					     "is32fl3207",
+					     profile->led_address);
+		if (err && !ret)
+			ret = err;
+	}
+
+	i2c_put_adapter(adapter);
+	return ret;
+}
+
+static void
+ptp_ocp_i2c_remove_mux(struct ptp_ocp *bp)
+{
+	struct fwnode_handle *fwnode;
+	struct i2c_client *client;
+
+	if (!bp->i2c_topology || !bp->i2c_topology->registered)
+		return;
+
+	fwnode = software_node_fwnode(&bp->i2c_topology->mux_node);
+	client = i2c_find_device_by_fwnode(fwnode);
+	if (!client)
+		return;
+
+	i2c_unregister_device(client);
+	put_device(&client->dev);
+}
+
+static void
+ptp_ocp_i2c_kick(struct ptp_ocp *bp)
+{
+	if (!ptp_ocp_i2c_supported(bp))
+		return;
+	if (!READ_ONCE(bp->i2c_resources_ready))
+		return;
+	if (!READ_ONCE(bp->i2c_root_present))
+		return;
+
+	mod_delayed_work(system_wq, &bp->i2c_work, 1);
+}
+
+static void
+ptp_ocp_i2c_retry(struct ptp_ocp *bp, int error)
+{
+	unsigned long delay = HZ;
+	unsigned int retries;
+	bool exhausted;
+
+	if (!READ_ONCE(bp->i2c_resources_ready))
+		return;
+	if (!READ_ONCE(bp->i2c_root_present))
+		return;
+
+	exhausted = bp->i2c_retry_count == OCP_I2C_RETRY_MAX - 1;
+	if (bp->i2c_retry_count < OCP_I2C_RETRY_MAX)
+		bp->i2c_retry_count++;
+	retries = bp->i2c_retry_count;
+	if (retries >= OCP_I2C_RETRY_MAX) {
+		if (exhausted)
+			dev_err(&bp->pdev->dev,
+				"I2C topology failed after %d attempts: %pe; "
+				"retrying every %d seconds\n",
+				OCP_I2C_RETRY_MAX, ERR_PTR(error),
+				OCP_I2C_RECOVERY_SECS);
+		delay = OCP_I2C_RECOVERY_SECS * HZ;
+	}
+
+	/* Preserve a faster rerun queued by an I2C bus notification. */
+	queue_delayed_work(system_wq, &bp->i2c_work, delay);
+}
+
+static int
+ptp_ocp_i2c_populate_topology(struct ptp_ocp *bp,
+			      struct platform_device *i2c_ctrl)
+{
+	const struct software_node *node;
+	struct i2c_adapter *adapter;
+	unsigned int channel;
+	int err, ret = 0;
+
+	if (!READ_ONCE(bp->i2c_root_present))
+		return 0;
+	if (!ptp_ocp_i2c_supported(bp) || !bp->i2c_profile)
+		return 0;
+
+	adapter = ptp_ocp_i2c_root_adapter(i2c_ctrl);
+	if (!adapter)
+		return -EAGAIN;
+
+	ret = ptp_ocp_i2c_init_nodes(bp);
+	if (ret)
+		goto out_put_adapter;
+
+	node = &bp->i2c_topology->mux_node;
+	ret = ptp_ocp_i2c_add_device(adapter, node, OCP_I2C_MUX_TYPE,
+				     OCP_I2C_MUX_ADDRESS);
+	if (ret)
+		goto out_put_adapter;
+
+	for (channel = 0; channel < OCP_I2C_MUX_CHANNELS; channel++) {
+		err = ptp_ocp_i2c_populate_channel(bp, channel);
+		if (err && !ret)
+			ret = err;
+	}
+
+out_put_adapter:
+	i2c_put_adapter(adapter);
+	return ret;
+}
+
+static void
+ptp_ocp_i2c_work(struct work_struct *work)
+{
+	struct ptp_ocp *bp = container_of(work, struct ptp_ocp,
+					  i2c_work.work);
+	struct platform_device *i2c_ctrl;
+	struct device *i2c_ctrl_dev;
+	unsigned int retries;
+	int ret = 0;
+
+	/* Pair with resource publication after registration. */
+	if (!smp_load_acquire(&bp->i2c_resources_ready))
+		return;
+	if (!ptp_ocp_i2c_supported(bp))
+		return;
+
+	mutex_lock(&bp->i2c_topology_lock);
+	if (!READ_ONCE(bp->i2c_resources_ready) ||
+	    !READ_ONCE(bp->i2c_root_present)) {
+		mutex_unlock(&bp->i2c_topology_lock);
+		return;
+	}
+
+	i2c_ctrl = READ_ONCE(bp->i2c_ctrl);
+	if (!i2c_ctrl) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
+	i2c_ctrl_dev = get_device(&i2c_ctrl->dev);
+	ret = ptp_ocp_i2c_populate_topology(bp, i2c_ctrl);
+	put_device(i2c_ctrl_dev);
+
+out_unlock:
+	mutex_unlock(&bp->i2c_topology_lock);
+
+	if (ret) {
+		ptp_ocp_i2c_retry(bp, ret);
+		return;
+	}
+
+	retries = bp->i2c_retry_count;
+	bp->i2c_retry_count = 0;
+	if (retries >= OCP_I2C_RETRY_MAX)
+		dev_info(&bp->pdev->dev, "I2C topology setup recovered\n");
+}
+
+static void
+ptp_ocp_i2c_unregister(struct ptp_ocp *bp)
+{
+	struct ptp_ocp_i2c_topology *topology;
+
+	WRITE_ONCE(bp->i2c_resources_ready, false);
+	WRITE_ONCE(bp->i2c_root_present, false);
+	disable_delayed_work_sync(&bp->i2c_work);
+	mutex_lock(&bp->i2c_topology_lock);
+	topology = bp->i2c_topology;
+	if (!topology) {
+		bp->i2c_profile = NULL;
+		goto out;
+	}
+
+	if (topology->registered) {
+		ptp_ocp_i2c_remove_mux(bp);
+		software_node_unregister_node_group(topology->node_group);
+		topology->registered = false;
+	}
+
+	bp->i2c_topology = NULL;
+	bp->i2c_profile = NULL;
+
+out:
+	bp->i2c_retry_count = 0;
+	mutex_unlock(&bp->i2c_topology_lock);
+}
+
 static struct device *
 ptp_ocp_find_flash(struct ptp_ocp *bp)
 {
@@ -2330,7 +2871,7 @@ ptp_ocp_register_i2c(struct ptp_ocp *bp, struct ocp_resource *r)
 	if (IS_ERR(p))
 		return PTR_ERR(p);
 
-	bp_assign_entry(bp, r, p);
+	WRITE_ONCE(bp->i2c_ctrl, p);
 
 	return 0;
 }
@@ -4786,6 +5327,7 @@ ptp_ocp_device_init(struct ptp_ocp *bp, struct pci_dev *pdev)
 	bp->ptp_info = ptp_ocp_clock_info;
 	spin_lock_init(&bp->lock);
 	mutex_init(&bp->eeprom_lock);
+	mutex_init(&bp->i2c_topology_lock);
 
 	for (i = 0; i < __PORT_COUNT; i++)
 		bp->port[i].line = -1;
@@ -4915,6 +5457,7 @@ ptp_ocp_detach_sysfs(struct ptp_ocp *bp)
 {
 	struct device *dev = &bp->dev;
 
+	sysfs_remove_link(&dev->kobj, "i2c");
 	sysfs_remove_link(&dev->kobj, "ptp");
 	sysfs_remove_link(&dev->kobj, "pps");
 }
@@ -4922,8 +5465,19 @@ ptp_ocp_detach_sysfs(struct ptp_ocp *bp)
 static void
 ptp_ocp_detach(struct ptp_ocp *bp)
 {
+	struct platform_device *i2c_ctrl;
 	int i;
 
+	if (bp->i2c_ctrl_notifier_registered) {
+		bus_unregister_notifier(&platform_bus_type,
+					&bp->i2c_ctrl_notifier);
+		bp->i2c_ctrl_notifier_registered = false;
+	}
+	if (bp->i2c_notifier_registered) {
+		bus_unregister_notifier(&i2c_bus_type, &bp->i2c_notifier);
+		bp->i2c_notifier_registered = false;
+	}
+	ptp_ocp_i2c_unregister(bp);
 	ptp_ocp_debugfs_remove_device(bp);
 	ptp_ocp_detach_sysfs(bp);
 	ptp_ocp_attr_group_del(bp);
@@ -4955,8 +5509,13 @@ ptp_ocp_detach(struct ptp_ocp *bp)
 	for (i = 0; i < __PORT_COUNT; i++)
 		if (bp->port[i].line != -1)
 			serial8250_unregister_port(bp->port[i].line);
-	platform_device_unregister(bp->spi_flash);
-	platform_device_unregister(bp->i2c_ctrl);
+	if (bp->spi_flash)
+		platform_device_unregister(bp->spi_flash);
+	i2c_ctrl = READ_ONCE(bp->i2c_ctrl);
+	if (i2c_ctrl) {
+		WRITE_ONCE(bp->i2c_ctrl, NULL);
+		platform_device_unregister(i2c_ctrl);
+	}
 	if (bp->i2c_clk)
 		clk_hw_unregister_fixed_rate(bp->i2c_clk);
 	if (bp->n_irqs)
@@ -5138,6 +5697,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_disable;
 
 	INIT_DELAYED_WORK(&bp->sync_work, ptp_ocp_sync_work);
+	INIT_DELAYED_WORK(&bp->i2c_work, ptp_ocp_i2c_work);
 
 	/* compat mode.
 	 * Older FPGA firmware only returns 2 irq's.
@@ -5152,9 +5712,32 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	bp->n_irqs = err;
 	pci_set_master(pdev);
 
+	bp->i2c_notifier.notifier_call = ptp_ocp_i2c_notifier_call;
+	err = bus_register_notifier(&i2c_bus_type, &bp->i2c_notifier);
+	if (err) {
+		dev_err(&pdev->dev,
+			"failed to register I2C notifier: %d\n", err);
+		goto out;
+	}
+	bp->i2c_notifier_registered = true;
+	bp->i2c_ctrl_notifier.notifier_call =
+		ptp_ocp_i2c_ctrl_notifier_call;
+	err = bus_register_notifier(&platform_bus_type,
+				    &bp->i2c_ctrl_notifier);
+	if (err) {
+		dev_err(&pdev->dev,
+			"failed to register I2C controller notifier: %d\n",
+			err);
+		goto out;
+	}
+	bp->i2c_ctrl_notifier_registered = true;
+
 	err = ptp_ocp_register_resources(bp, id->driver_data);
 	if (err)
 		goto out;
+	/* Publish all board resources before I2C topology work can run. */
+	smp_store_release(&bp->i2c_resources_ready, true);
+	ptp_ocp_i2c_kick(bp);
 
 	bp->ptp = ptp_clock_register(&bp->ptp_info, &pdev->dev);
 	if (IS_ERR(bp->ptp)) {
@@ -5248,46 +5831,115 @@ static struct pci_driver ptp_ocp_driver = {
 	.shutdown	= ptp_ocp_remove,
 };
 
+static bool
+ptp_ocp_i2c_is_child(struct ptp_ocp *bp, struct device *child)
+{
+	struct device *dev = child;
+
+	while (dev) {
+		if (dev == &bp->pdev->dev)
+			return true;
+		dev = dev->parent;
+	}
+
+	return false;
+}
+
+static bool
+ptp_ocp_i2c_is_root(struct ptp_ocp *bp, struct i2c_adapter *adapter)
+{
+	struct platform_device *i2c_ctrl = READ_ONCE(bp->i2c_ctrl);
+	struct device *parent = adapter->dev.parent;
+
+	if (!parent)
+		return false;
+	if (i2c_ctrl && parent == &i2c_ctrl->dev)
+		return true;
+
+	/* The adapter can notify before ptp_ocp_register_i2c() stores it. */
+	return parent->parent == &bp->pdev->dev;
+}
+
+static int
+ptp_ocp_i2c_ctrl_notifier_call(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct ptp_ocp *bp = container_of(nb, struct ptp_ocp,
+					  i2c_ctrl_notifier);
+	struct platform_device *i2c_ctrl = READ_ONCE(bp->i2c_ctrl);
+	struct device *dev = data;
+
+	if (action != BUS_NOTIFY_UNBIND_DRIVER || !i2c_ctrl ||
+	    dev != &i2c_ctrl->dev)
+		return 0;
+
+	/*
+	 * Stop topology creation before the controller driver's remove path
+	 * deletes its root adapter. Otherwise a newly-created mux client can
+	 * pin that adapter after i2c_del_adapter() has swept its children.
+	 */
+	WRITE_ONCE(bp->i2c_root_present, false);
+	cancel_delayed_work_sync(&bp->i2c_work);
+	mutex_lock(&bp->i2c_topology_lock);
+	ptp_ocp_i2c_remove_mux(bp);
+	bp->i2c_retry_count = 0;
+	mutex_unlock(&bp->i2c_topology_lock);
+	sysfs_remove_link(&bp->dev.kobj, "i2c");
+
+	return 0;
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
+
+	bp = container_of(nb, struct ptp_ocp, i2c_notifier);
+	if (!ptp_ocp_i2c_is_child(bp, child))
+		return 0;
 
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
-	case BUS_NOTIFY_DEL_DEVICE:
-		add = action == BUS_NOTIFY_ADD_DEVICE;
-		break;
-	default:
+		adapter = i2c_verify_adapter(child);
+		if (!adapter)
+			return 0;
+		if (ptp_ocp_i2c_is_root(bp, adapter)) {
+			WRITE_ONCE(bp->i2c_root_present, true);
+			ptp_ocp_symlink(bp, child, "i2c");
+		}
+		ptp_ocp_i2c_kick(bp);
 		return 0;
-	}
 
-	if (!i2c_verify_adapter(child))
+	case BUS_NOTIFY_DEL_DEVICE:
+		adapter = i2c_verify_adapter(child);
+		if (!adapter)
+			return 0;
+		if (ptp_ocp_i2c_is_root(bp, adapter)) {
+			WRITE_ONCE(bp->i2c_root_present, false);
+			sysfs_remove_link(&bp->dev.kobj, "i2c");
+		}
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
+		if (!ptp_ocp_i2c_is_root(bp, client->adapter))
+			return 0;
+		ptp_ocp_i2c_kick(bp);
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
 
-static struct notifier_block ptp_ocp_i2c_notifier = {
-	.notifier_call = ptp_ocp_i2c_notifier_call,
-};
-
 static int __init
 ptp_ocp_init(void)
 {
@@ -5301,21 +5953,14 @@ ptp_ocp_init(void)
 	if (err)
 		goto out;
 
-	what = "i2c notifier";
-	err = bus_register_notifier(&i2c_bus_type, &ptp_ocp_i2c_notifier);
-	if (err)
-		goto out_notifier;
-
 	what = "ptp_ocp driver";
 	err = pci_register_driver(&ptp_ocp_driver);
 	if (err)
-		goto out_register;
+		goto out_class;
 
 	return 0;
 
-out_register:
-	bus_unregister_notifier(&i2c_bus_type, &ptp_ocp_i2c_notifier);
-out_notifier:
+out_class:
 	class_unregister(&timecard_class);
 out:
 	ptp_ocp_debugfs_fini();
@@ -5326,7 +5971,6 @@ ptp_ocp_init(void)
 static void __exit
 ptp_ocp_fini(void)
 {
-	bus_unregister_notifier(&i2c_bus_type, &ptp_ocp_i2c_notifier);
 	pci_unregister_driver(&ptp_ocp_driver);
 	class_unregister(&timecard_class);
 	ptp_ocp_debugfs_fini();
-- 
2.50.1 (Apple Git-155)

