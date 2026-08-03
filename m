Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C6E4399CE
	for <linux-leds@vger.kernel.org>; Mon,  3 Aug 2026 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790241; cv=none; b=gHd76dKbGsm6e8HT3HqPAj16YOZvStsszeB+BlfLFiIA77gM39FbbVbVWVS3f32kQHSNGiZjQKRkZkyrsFqDxys3G4zGBKnohEikHjcv8MEIDnnGVdxEEsCSg3XpApNj9n6PLR3Y52WeU1z2Z3nD9WouQhHohlbZ/aDbjffccl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790241; c=relaxed/simple;
	bh=dmP+q87qicjyW18ozyL+ogXe7/5/GdMXTvpy0iRKLrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHnAc0ba14fbrBz6Iipop84YFglK8hjRgNhL9+aGn/lsyCQoSbmbAc6Rsa0eOpDBSc8eZqJ1aQSIYtltgzRbPfhgCfu7lnbHNRAkLAdkYSqUo8wIPPBvogpTXl7c0DihllRNaR+6Xy/lOt2tSLT53gnyHYLqgPWk/WtN09RlzP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QP9+TDFW; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QP9+TDFW"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2899552a91.0
        for <linux-leds@vger.kernel.org>; Mon, 03 Aug 2026 13:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790237; x=1786395037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqCB45N3f0im5p2UcDZQfhCmgK03i2WHE7t+nKif+84=;
        b=QP9+TDFWwpnMScPIEKDq0JratEqHl/LJDADQzlHjQdwfuCeOHVsjg4L8sdexItlnca
         8cJKUlC3WRsMdsgO5rM0lC8d5DT2LrM111TT0BOjeY6MVabE8clw9FpolW2cFIXSDGk7
         aO2TB9xyFEJ5JLyWx3lVK9A+LXhbvBQsfgaym07z3EayMqqa4Czr+yWIBhXxPmAUbbUt
         U4t82dhF0+4R/X6MRY5CPsSFZ+J+UXYzNbY5AJIKfuhqrUVzmhojH7htE+lPksfDZWEp
         oLjEEF5hTJvRyTo6pKRaeQzBOTTeO+Rwkn5TYWhJbZDSW7xZIGt2QSBxSIhzlZe6hkJI
         zkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790237; x=1786395037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqCB45N3f0im5p2UcDZQfhCmgK03i2WHE7t+nKif+84=;
        b=Bh9VfZXC7KU6HKXksy4y3jLZGhOYkKhXKOKBaAXaCsXcuLhgKRl+XhPoWQe89sh/AP
         YKT0eopgcg3BXfdA6OYktvGvT3DFzEdBuQ/sHTxJ0rviXSzD+3WmiD0pmrQrDO0JP+LP
         xn+MpPZcIx7x9AyUybtrFLYhylkHx6rqeOOwZXfEigI3tJI1/pFhbBdZFUEH52aiSQzq
         gSlARYoq7g1LTpFmh7CWUaHMY/4TRcgRMgzssnN9gxJhdbisdorDiQ79j47ulZ7D+PdL
         UM7KCtON9ehgfMA8QOuRc6sscBUiLtXqjES30u7Ae35jxbPUjlmxjYUaNM1a3nsqahAk
         581w==
X-Gm-Message-State: AOJu0Yxl157z5jwj1NulIVWoCTReJ2MUscGlYh0Gdqev9Qcj0hs+GR7L
	FnlyZQ9e94Q8FVXaDb9Cuyhen5fLRYI6Pph5W+kVlK7K8PSJLuWB/mVO1n+nA01s
X-Gm-Gg: AR+sD11BrGrNorvsOuinLxcTOwEE9xZ91pc7etRru5ga9FEPvtM6haY+xKN/hxDzVWV
	lGwNC9Aq/VoT4XPtN844TNzDyCrkZlO6WvrXQEgnZlAcp2xBozTxZbgrXoKwhDFU7gXdJBEO3R9
	Ld0CU/IS1mAcMNDsGTvts6Eka7lJknV87e/sy9mV3mhWld5mo4XoqHMylbp7HzxLaNu0OXakT3U
	pyaR71OjETqy5zJiE/Im7t7EQ5mkiZ9Cr5ul0QQ/JdKCc5tfU4cD6YbBAYrjE896aFOLGhsyRVc
	Asb3/TS/JsEGJ5mFiB1EFoMq+uP2gsGr+OFzkmd/YwOMGWpUXiZsiWU5LjTWozO7M0ohKODreJP
	iol4FRlFiXTALg0CoRlhi9QBJR5XvgakRKpT71q1u9e7zMeS/XyGOf0Yj2Vg9RTpwd1eJeotd9J
	1Yqoglr79pkCnfTAZ8PAnn1ap3IRaSJKciMv6ZwP+5Jia0QII2lL+e3rq2p/SZtbaxp4Bj
X-Received: by 2002:a17:90b:3f44:b0:38f:decc:33c7 with SMTP id 98e67ed59e1d1-38fdecc3428mr3756451a91.42.1785790236904;
        Mon, 03 Aug 2026 13:50:36 -0700 (PDT)
Received: from Mac.net ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm33112324c88.11.2026.08.03.13.50.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Aug 2026 13:50:36 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org
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
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next v2 5/6] ptp: ocp: Add R4006 I2C peripheral topology
Date: Mon,  3 Aug 2026 13:50:10 -0700
Message-ID: <20260803205011.1249-6-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260803205011.1249-1-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R4006 cards place a PCA9546 mux behind the FPGA I2C controller. The mux
exposes three LM75B temperature sensors, an SHT3x humidity sensor, an
ICP10100 pressure sensor, and an IS32FL3207 controller for the GNSS and
SMA LEDs.

Describe the per-card topology with software nodes and instantiate
standard I2C clients after their adapters appear. Use a reusable board
profile selected only when the validated EEPROM ID begins with "R4006".
PCI IDs are shared by multiple PCB revisions and cannot safely select
LED wiring.

Leave the channel containing the BNO08x empty because no upstream driver
exists. Retry asynchronous population with a bounded budget. Serialize
population against controller and mux driver bind/unbind, remove the mux
when the root adapter disappears, and support adapter reappearance. Limit
the existing i2c sysfs link to the root adapter.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 736 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 693 insertions(+), 43 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index cec936bd1..70ba47096 100644
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
@@ -347,6 +351,17 @@ struct ptp_ocp_serial_port {
 #define OCP_SIGNAL_NUM			4
 #define OCP_FREQ_NUM			4
 
+#define OCP_I2C_MUX_CHANNELS		4
+#define OCP_I2C_MAX_SENSOR_COUNT	5
+#define OCP_I2C_MAX_LED_COUNT		5
+#define OCP_I2C_MAX_LED_COMPONENT_COUNT	(3 * OCP_I2C_MAX_LED_COUNT)
+#define OCP_I2C_MUX_NAME_LEN		32
+#define OCP_I2C_RETRY_MAX		10
+#define OCP_I2C_MAX_NODE_COUNT		(1 + OCP_I2C_MUX_CHANNELS + \
+					 OCP_I2C_MAX_SENSOR_COUNT + 1 + \
+					 OCP_I2C_MAX_LED_COUNT + \
+					 OCP_I2C_MAX_LED_COMPONENT_COUNT)
+
 enum ptp_ocp_board_id_state {
 	OCP_BOARD_ID_UNREAD,
 	OCP_BOARD_ID_VALID,
@@ -354,6 +369,51 @@ enum ptp_ocp_board_id_state {
 	OCP_BOARD_ID_INVALID,
 };
 
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
+	u8 led_address;
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
+	struct property_entry component_props[OCP_I2C_MAX_LED_COMPONENT_COUNT][4];
+	const struct software_node *node_group[OCP_I2C_MAX_NODE_COUNT + 1];
+	const struct ptp_ocp_i2c_profile *profile;
+	bool registered;
+};
+
 enum {
 	PORT_GNSS,
 	PORT_GNSS2,
@@ -410,6 +470,7 @@ struct ptp_ocp {
 	u16			fw_version;
 	char			board_id[OCP_BOARD_ID_LEN + 1];
 	u8			serial[OCP_SERIAL_LEN];
+	struct mutex		eeprom_lock; /* Serializes EEPROM discovery. */
 	enum ptp_ocp_board_id_state board_id_state;
 	bool			has_eeprom_data;
 	u32			pps_req_map;
@@ -422,6 +483,14 @@ struct ptp_ocp {
 	const struct ocp_sma_op *sma_op;
 	struct dpll_device *dpll;
 	dpll_tracker tracker;
+	const struct ptp_ocp_i2c_profile *i2c_profile;
+	struct ptp_ocp_i2c_topology *i2c_topology;
+	struct delayed_work i2c_work;
+	struct notifier_block i2c_notifier;
+	atomic_t i2c_retry_count;
+	bool i2c_root_present;
+	bool i2c_resources_ready;
+	bool i2c_notifier_registered;
 	int signals_nr;
 	int freq_in_nr;
 };
@@ -452,6 +521,8 @@ static int ptp_ocp_signal_from_perout(struct ptp_ocp *bp, int gen,
 				      struct ptp_perout_request *req);
 static int ptp_ocp_signal_enable(void *priv, u32 req, bool enable);
 static int ptp_ocp_sma_store(struct ptp_ocp *bp, const char *buf, int sma_nr);
+static int ptp_ocp_i2c_notifier_call(struct notifier_block *nb,
+				     unsigned long action, void *data);
 
 static int ptp_ocp_art_board_init(struct ptp_ocp *bp, struct ocp_resource *r);
 
@@ -501,6 +572,65 @@ static struct ptp_ocp_eeprom_map art_eeprom_map[] = {
 	{ }
 };
 
+/* Channel 3's BNO08x at 0x4a has no upstream Linux driver, so omit it. */
+static const struct ptp_ocp_i2c_device ptp_ocp_r4006_sensors[] = {
+	{ "temperature@48", "national,lm75b", "lm75b", 0, 0x48 },
+	{ "temperature@49", "national,lm75b", "lm75b", 0, 0x49 },
+	{ "temperature@4a", "national,lm75b", "lm75b", 0, 0x4a },
+	{ "humidity@44", "sensirion,sht3x", "sht3x", 1, 0x44 },
+	{ "pressure@63", "invensense,icp10100", "icp10100", 2, 0x63 },
+};
+
+static const struct ptp_ocp_led ptp_ocp_r4006_leds[] = {
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
+static_assert(ARRAY_SIZE(ptp_ocp_r4006_sensors) <=
+	      OCP_I2C_MAX_SENSOR_COUNT);
+static_assert(ARRAY_SIZE(ptp_ocp_r4006_leds) <= OCP_I2C_MAX_LED_COUNT);
+
+static const struct ptp_ocp_i2c_profile ptp_ocp_r4006_profile = {
+	.name = "r4006",
+	.sensors = ptp_ocp_r4006_sensors,
+	.sensor_count = ARRAY_SIZE(ptp_ocp_r4006_sensors),
+	.leds = ptp_ocp_r4006_leds,
+	.led_count = ARRAY_SIZE(ptp_ocp_r4006_leds),
+	.led_node_name = "led-controller@34",
+	.led_address = 0x34,
+};
+
 #define bp_assign_entry(bp, res, val) ({				\
 	uintptr_t addr = (uintptr_t)(bp) + (res)->bp_offset;		\
 	*(typeof(val) *)addr = val;					\
@@ -1961,8 +2091,8 @@ ptp_ocp_nvmem_match(struct device *dev, const void *data)
 		return 0;
 
 	while ((dev = dev->parent))
-		if (dev->driver && !strcmp(dev->driver->name, KBUILD_MODNAME))
-			return info->bp == dev_get_drvdata(dev);
+		if (dev == &info->bp->pdev->dev)
+			return 1;
 	return 0;
 }
 
@@ -1982,6 +2112,12 @@ ptp_ocp_nvmem_device_put(struct nvmem_device **nvmemp)
 	*nvmemp = NULL;
 }
 
+static bool
+ptp_ocp_has_eeprom_data(struct ptp_ocp *bp)
+{
+	return smp_load_acquire(&bp->has_eeprom_data);
+}
+
 static enum ptp_ocp_board_id_state
 ptp_ocp_classify_board_id(char *board_id)
 {
@@ -2036,11 +2172,11 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
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
@@ -2061,10 +2197,13 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 	}
 
 	bp->board_id_state = ptp_ocp_classify_board_id(bp->board_id);
-	bp->has_eeprom_data = true;
+
+	/* Publish the EEPROM fields before readers observe valid data. */
+	smp_store_release(&bp->has_eeprom_data, true);
 
 out:
 	ptp_ocp_nvmem_device_put(&nvmem);
+	mutex_unlock(&bp->eeprom_lock);
 	return;
 
 fail:
@@ -2072,6 +2211,467 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
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
+static const struct ptp_ocp_i2c_profile *
+ptp_ocp_i2c_select_profile(struct ptp_ocp *bp)
+{
+	/* PCI IDs identify FPGA images, not a unique PCB revision. */
+	if (!((bp->pdev->vendor == PCI_VENDOR_ID_META &&
+	       bp->pdev->device == PCI_DEVICE_ID_META_TIMECARD) ||
+	      (bp->pdev->vendor == PCI_VENDOR_ID_CELESTICA &&
+	       bp->pdev->device == PCI_DEVICE_ID_CELESTICA_TIMECARD)))
+		return NULL;
+
+	if (!ptp_ocp_has_eeprom_data(bp))
+		return NULL;
+	if (bp->board_id_state != OCP_BOARD_ID_VALID)
+		return NULL;
+
+	if (!strncmp(bp->board_id, "R4006", 5))
+		return &ptp_ocp_r4006_profile;
+
+	return NULL;
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
+	if (WARN_ON(profile->sensor_count > OCP_I2C_MAX_SENSOR_COUNT ||
+		    profile->led_count > OCP_I2C_MAX_LED_COUNT))
+		return -EINVAL;
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
+		PROPERTY_ENTRY_STRING("compatible", "nxp,pca9546");
+	topology->mux_props[1] = PROPERTY_ENTRY_U32("reg", 0x70);
+	topology->mux_props[2] =
+		PROPERTY_ENTRY_BOOL("i2c-mux-idle-disconnect");
+	topology->mux_props[3] = PROPERTY_ENTRY_U32("#address-cells", 1);
+	topology->mux_props[4] = PROPERTY_ENTRY_U32("#size-cells", 0);
+	topology->node_group[node++] = &topology->mux_node;
+
+	for (i = 0; i < OCP_I2C_MUX_CHANNELS; i++) {
+		topology->channel_nodes[i].name = channel_names[i];
+		topology->channel_nodes[i].parent = &topology->mux_node;
+		topology->channel_nodes[i].properties = topology->channel_props[i];
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
+		topology->sensor_nodes[i].properties = topology->sensor_props[i];
+		topology->sensor_props[i][0] =
+			PROPERTY_ENTRY_STRING("compatible", sensor->compatible);
+		topology->sensor_props[i][1] =
+			PROPERTY_ENTRY_U32("reg", sensor->address);
+		topology->node_group[node++] = &topology->sensor_nodes[i];
+	}
+
+	topology->led_node.name = profile->led_node_name;
+	topology->led_node.parent = &topology->channel_nodes[1];
+	topology->led_node.properties = topology->led_props;
+	topology->led_props[0] =
+		PROPERTY_ENTRY_STRING("compatible", "issi,is32fl3207");
+	topology->led_props[1] =
+		PROPERTY_ENTRY_U32("reg", profile->led_address);
+	topology->led_props[2] =
+		PROPERTY_ENTRY_U32("issi,riset-ohms", 4700);
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
+				PROPERTY_ENTRY_U32("led-max-microamp", 8150);
+			topology->node_group[node++] =
+				&topology->component_nodes[component];
+		}
+	}
+
+	expected_nodes = 1 + OCP_I2C_MUX_CHANNELS + profile->sensor_count + 1 +
+		profile->led_count + 3 * profile->led_count;
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
+		return dev_err_probe(dev, ret,
+				     "failed to register %s firmware nodes\n",
+				     profile->name);
+
+	topology->registered = true;
+	return 0;
+}
+
+static int
+ptp_ocp_i2c_add_device(struct ptp_ocp *bp, struct i2c_adapter *adapter,
+		       const struct software_node *node, const char *type,
+		       u16 address)
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
+		err = ptp_ocp_i2c_add_device(bp, adapter, node, sensor->type,
+					     sensor->address);
+		if (err && !ret)
+			ret = err;
+	}
+
+	if (channel == 1) {
+		err = ptp_ocp_i2c_add_device(bp, adapter, &topology->led_node,
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
+	if (!READ_ONCE(bp->i2c_resources_ready))
+		return;
+	if (!READ_ONCE(bp->i2c_root_present))
+		return;
+
+	atomic_set(&bp->i2c_retry_count, 0);
+	mod_delayed_work(system_wq, &bp->i2c_work, 1);
+}
+
+static void
+ptp_ocp_i2c_retry(struct ptp_ocp *bp)
+{
+	if (!READ_ONCE(bp->i2c_resources_ready))
+		return;
+	if (!READ_ONCE(bp->i2c_root_present))
+		return;
+	if (atomic_inc_return(&bp->i2c_retry_count) > OCP_I2C_RETRY_MAX)
+		return;
+
+	mod_delayed_work(system_wq, &bp->i2c_work, HZ);
+}
+
+static void
+ptp_ocp_i2c_populate_topology(struct ptp_ocp *bp,
+			      struct platform_device *i2c_ctrl,
+			      bool *retry)
+{
+	const struct software_node *node;
+	struct i2c_adapter *adapter;
+	struct fwnode_handle *fwnode;
+	struct i2c_client *mux;
+	unsigned int channel;
+	int ret;
+
+	if (!READ_ONCE(bp->i2c_root_present)) {
+		ptp_ocp_i2c_remove_mux(bp);
+		return;
+	}
+	if (!device_is_registered(&i2c_ctrl->dev) ||
+	    !device_is_bound(&i2c_ctrl->dev)) {
+		*retry = true;
+		return;
+	}
+	if (!bp->eeprom_map)
+		return;
+
+	adapter = ptp_ocp_i2c_root_adapter(bp);
+	if (!adapter) {
+		*retry = true;
+		return;
+	}
+
+	if (!ptp_ocp_has_eeprom_data(bp))
+		ptp_ocp_read_eeprom(bp);
+	if (!ptp_ocp_has_eeprom_data(bp)) {
+		*retry = true;
+		goto out_put_adapter;
+	}
+	if (!bp->i2c_profile)
+		bp->i2c_profile = ptp_ocp_i2c_select_profile(bp);
+	if (!bp->i2c_profile)
+		goto out_put_adapter;
+
+	ret = ptp_ocp_i2c_init_nodes(bp);
+	if (ret) {
+		*retry = true;
+		goto out_put_adapter;
+	}
+
+	node = &bp->i2c_topology->mux_node;
+	ret = ptp_ocp_i2c_add_device(bp, adapter, node, "pca9546", 0x70);
+	if (ret) {
+		*retry = true;
+		goto out_put_adapter;
+	}
+
+	fwnode = software_node_fwnode(&bp->i2c_topology->mux_node);
+	mux = i2c_find_device_by_fwnode(fwnode);
+	if (!mux) {
+		*retry = true;
+		goto out_put_adapter;
+	}
+
+	device_lock(&mux->dev);
+	if (!device_is_registered(&mux->dev) || !device_is_bound(&mux->dev)) {
+		*retry = true;
+		goto out_unlock_mux;
+	}
+
+	for (channel = 0; channel < OCP_I2C_MUX_CHANNELS; channel++) {
+		ret = ptp_ocp_i2c_populate_channel(bp, channel);
+		if (ret)
+			*retry = true;
+	}
+
+out_unlock_mux:
+	device_unlock(&mux->dev);
+	put_device(&mux->dev);
+out_put_adapter:
+	i2c_put_adapter(adapter);
+}
+
+static void
+ptp_ocp_i2c_work(struct work_struct *work)
+{
+	struct ptp_ocp *bp = container_of(work, struct ptp_ocp, i2c_work.work);
+	struct platform_device *i2c_ctrl;
+	bool retry = false;
+
+	/* Pair with resource publication after registration. */
+	if (!smp_load_acquire(&bp->i2c_resources_ready))
+		return;
+
+	i2c_ctrl = bp->i2c_ctrl;
+	if (!i2c_ctrl) {
+		ptp_ocp_i2c_retry(bp);
+		return;
+	}
+
+	device_lock(&i2c_ctrl->dev);
+	ptp_ocp_i2c_populate_topology(bp, i2c_ctrl, &retry);
+	device_unlock(&i2c_ctrl->dev);
+
+	if (retry)
+		ptp_ocp_i2c_retry(bp);
+	else
+		atomic_set(&bp->i2c_retry_count, 0);
+}
+
+static void
+ptp_ocp_i2c_unregister(struct ptp_ocp *bp)
+{
+	struct device *i2c_ctrl_dev = NULL;
+
+	WRITE_ONCE(bp->i2c_resources_ready, false);
+	WRITE_ONCE(bp->i2c_root_present, false);
+	disable_delayed_work_sync(&bp->i2c_work);
+	if (bp->i2c_ctrl) {
+		i2c_ctrl_dev = &bp->i2c_ctrl->dev;
+		device_lock(i2c_ctrl_dev);
+	}
+	if (!bp->i2c_topology) {
+		bp->i2c_profile = NULL;
+		goto out_unlock;
+	}
+
+	if (bp->i2c_topology->registered) {
+		ptp_ocp_i2c_remove_mux(bp);
+		software_node_unregister_node_group(bp->i2c_topology->node_group);
+		bp->i2c_topology->registered = false;
+	}
+
+	bp->i2c_topology = NULL;
+	bp->i2c_profile = NULL;
+
+out_unlock:
+	if (i2c_ctrl_dev)
+		device_unlock(i2c_ctrl_dev);
+}
+
 static struct device *
 ptp_ocp_find_flash(struct ptp_ocp *bp)
 {
@@ -2226,9 +2826,9 @@ ptp_ocp_devlink_info_get(struct devlink *devlink, struct devlink_info_req *req,
 	if (err)
 		return err;
 
-	if (!bp->has_eeprom_data) {
+	if (!ptp_ocp_has_eeprom_data(bp)) {
 		ptp_ocp_read_eeprom(bp);
-		if (!bp->has_eeprom_data)
+		if (!ptp_ocp_has_eeprom_data(bp))
 			return 0;
 	}
 
@@ -3819,7 +4419,7 @@ serialnum_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct ptp_ocp *bp = dev_get_drvdata(dev);
 
-	if (!bp->has_eeprom_data)
+	if (!ptp_ocp_has_eeprom_data(bp))
 		ptp_ocp_read_eeprom(bp);
 
 	return sysfs_emit(buf, "%pM\n", bp->serial);
@@ -4790,6 +5390,7 @@ ptp_ocp_device_init(struct ptp_ocp *bp, struct pci_dev *pdev)
 
 	bp->ptp_info = ptp_ocp_clock_info;
 	spin_lock_init(&bp->lock);
+	mutex_init(&bp->eeprom_lock);
 
 	for (i = 0; i < __PORT_COUNT; i++)
 		bp->port[i].line = -1;
@@ -4928,6 +5529,11 @@ ptp_ocp_detach(struct ptp_ocp *bp)
 {
 	int i;
 
+	if (bp->i2c_notifier_registered) {
+		bus_unregister_notifier(&i2c_bus_type, &bp->i2c_notifier);
+		bp->i2c_notifier_registered = false;
+	}
+	ptp_ocp_i2c_unregister(bp);
 	ptp_ocp_debugfs_remove_device(bp);
 	ptp_ocp_detach_sysfs(bp);
 	ptp_ocp_attr_group_del(bp);
@@ -5142,6 +5748,8 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_disable;
 
 	INIT_DELAYED_WORK(&bp->sync_work, ptp_ocp_sync_work);
+	INIT_DELAYED_WORK(&bp->i2c_work, ptp_ocp_i2c_work);
+	atomic_set(&bp->i2c_retry_count, 0);
 
 	/* compat mode.
 	 * Older FPGA firmware only returns 2 irq's.
@@ -5156,9 +5764,20 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	bp->n_irqs = err;
 	pci_set_master(pdev);
 
+	bp->i2c_notifier.notifier_call = ptp_ocp_i2c_notifier_call;
+	err = bus_register_notifier(&i2c_bus_type, &bp->i2c_notifier);
+	if (err) {
+		dev_err(&pdev->dev, "failed to register I2C notifier: %d\n", err);
+		goto out;
+	}
+	bp->i2c_notifier_registered = true;
+
 	err = ptp_ocp_register_resources(bp, id->driver_data);
 	if (err)
 		goto out;
+	/* Publish all board resources before I2C topology work can run. */
+	smp_store_release(&bp->i2c_resources_ready, true);
+	ptp_ocp_i2c_kick(bp);
 
 	bp->ptp = ptp_clock_register(&bp->ptp_info, &pdev->dev);
 	if (IS_ERR(bp->ptp)) {
@@ -5252,46 +5871,85 @@ static struct pci_driver ptp_ocp_driver = {
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
-	struct ptp_ocp *bp;
-	bool add;
+	struct i2c_adapter *adapter;
+	struct i2c_client *client;
+	struct device *child = data;
+	struct ptp_ocp *bp = container_of(nb, struct ptp_ocp, i2c_notifier);
+
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
+			mod_delayed_work(system_wq, &bp->i2c_work, 0);
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
@@ -5305,21 +5963,14 @@ ptp_ocp_init(void)
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
@@ -5330,7 +5981,6 @@ ptp_ocp_init(void)
 static void __exit
 ptp_ocp_fini(void)
 {
-	bus_unregister_notifier(&i2c_bus_type, &ptp_ocp_i2c_notifier);
 	pci_unregister_driver(&ptp_ocp_driver);
 	class_unregister(&timecard_class);
 	ptp_ocp_debugfs_fini();
-- 
2.50.1 (Apple Git-155)

