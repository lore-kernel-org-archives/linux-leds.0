Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82A31F9A8
	for <linux-leds@vger.kernel.org>; Tue, 11 Aug 2026 05:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424584; cv=none; b=TqnCqjgQAT4PUB3dhqdEyc/qxnD5yo/BrKTAAcRkVv9jSIrqP08Qr0gqdQYlQkwRTi7MKddS1YaI8MD5WeYdF0e9aHFyCwdp7s3rHVl9xATiO8By9O5ScXtss0y0hipmhfuHtoERE/2YQAOu1YGw//9LPQ2WXC5kZrDSBHeVrJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424584; c=relaxed/simple;
	bh=qbT29I2CzZWeVZnhnEyPFxOtc1aecRPQo1/N7wBb2Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqYgfWFtVls4lP1pN2Kol7EVJeZHxLJ5kCoaVrBmE1cDlFG9IImg4b4QMSatu49grqeRzl2h+brlwvfvF8EBwMO0I4GVJB2wYJzFRoPgiO88MnLG14MV3efCXY5kAP1xq88QqCQtquaETFw6kBgNqWZAovTm1BzDWMH9SoLoKOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcEezrDF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcEezrDF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cedda2ce6fso22684645ad.1
        for <linux-leds@vger.kernel.org>; Mon, 10 Aug 2026 22:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424574; x=1787029374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moijbzDzsmh5XF7idfs/D6eyKTrAZoDD9bA5sLCOiyM=;
        b=NcEezrDFFaIXIgbo1CbRYsSJJJovBUi3PFOAArHqxXtKZGzy4e2oaWcWTRGfI/ppq9
         HNRTnSkB72Kkl0yz4N48cs+Kn1RQ6f5oApGql+Dues5HaXnJ65RsSdphlCalwqAmUQtJ
         RaX67PmvtCrpWuwqgrFl4njGD1pn02j/xg3hdbWkoUAjBcoksg1cWaNOJyz0PLEuHz+e
         lx1k4KVUFVdd+eMbY5ysxcXiMETdobS4BkXnvi75D2kNQa4+NOfcbaKCviB1BN6ioUUV
         HXK/dbU1S18LzhJ9fkabfvVO/5984XNamf8CXe2baZ4ivfbM7HrkJaD1RlfUaIDeMaIx
         SLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424574; x=1787029374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=moijbzDzsmh5XF7idfs/D6eyKTrAZoDD9bA5sLCOiyM=;
        b=tXaO+BeKmKk9Ov7DcVVecLu6fkeZt/5m3b37LlwNDW1NoB1g94dG/Kg2hNH8BevaJj
         ml+StX80cSxX0cnLaOnfG5s/zqONqQeL8A63sZWbXDCMwUWnERBaNZbwSXmvLJbo62Vj
         j8rwl99EkEIlGGIrbm90yEja1KeHRezVPrCUMl+O5DHiffRiW2gwrprJLUaA4+8feBbA
         OJRWk1nzdTvPfHpX3VNaXkR7AbQ32gkEWTs8C826Cac1T5xV/eDA5C6dEmUNV7grIDua
         8TqRXI782W8df8guQkMA2v+UwDUpjD5n10/mWoWe2nM7W5xXciDswJ5vDvC1JnLnGCDl
         /tVg==
X-Forwarded-Encrypted: i=1; AHgh+RpprY/0U3Fg4+jFEbyE2yU80hEOldy/E4+DmNXlTiCxecC9wpeVcOp41Sm8NH0LpR6ANf86hUbpqKZO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy31OAWgUUyO/3W0UBMjXeqzxRh0oFp2L3aTm3z+30NRS8Rsgni
	xR0pk3g92YfLHbctgT0XhmIsOlKA26h5c3fpKvLl+HuhjUo+TK27Ymh9
X-Gm-Gg: AR+sD138bFsMbXhJG4x4fSMzZCA4xU93lOdT/lt7YGPLf+NO5Zb16tbrPEJ5CCtDp1N
	NcUWFKxsE0U8MdtJuMG+poil/DMp57pqsCdK7NOKZaWXxm8JhY89YpQMQRwpqcC2idc6a7wsMnk
	W7Ad/cG80c2e/gwfhw9idf4ifRQHL5ah0evc5UoL4uw2v80uytTobDk+sCyn5XL3zCo+2E4pmXe
	RuEw9oYSk9QKHkb26aCzoiMgBt7Is/uxI03vD4wdwn3jSfmb+8JfQbtzDKYDmINrIPJzjgphZQC
	nhLM4LjV8vVhiiyM7vT5qm3Z+t39p1x1ku3uXpE5T5GoyYItIBwNKoKxXu0q3xChsQnr9S4eDCd
	3JhYQTeEsr1is3OV/DEMjMUb2cL+BLTRARS8EnyXAV+68WwKrrv4v7vqqrGw0oTO/G2cX9TjP4e
	ivillGmyEeY6/8W3I9HfxGpt+YLYNiOAoHH4RBnFfFWBOBI8tuWAj/pY4N7meDhTHol5xhCXn6w
	cXrJpzMEGps6t0EJVfq+pG76Dx0NDFF0MDWVy/qmXmpkMzi8w==
X-Received: by 2002:a17:903:26cb:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2d3177fb273mr9852895ad.7.1786424573298;
        Mon, 10 Aug 2026 22:02:53 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619cf07dsm660421eec.4.2026.08.10.22.02.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 22:02:52 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v3 4/5] ptp: ocp: Add R4006 I2C peripheral topology
Date: Mon, 10 Aug 2026 22:02:43 -0700
Message-ID: <c24e9a5ae1ef74f22ae716ed75d95c8ae4d73787.1786423898.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786423898.git.ahmadexp@gmail.com>
References: <cover.1786423898.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R4006 cards place a PCA9546 mux behind the FPGA I2C controller.
The mux exposes three LM75B temperature sensors, an SHT3x humidity
sensor, an ICP10100 pressure sensor, and an IS32FL3207 controller for
the GNSS and SMA LEDs.

Describe the per-card topology with software nodes and instantiate
standard I2C clients after their adapters appear. Keep the mux channel,
RISET value, and per-output current limit in the board profile, and
validate every profile index before constructing nodes.

Select the profile only on supported Time Card PCI devices whose
fixed-width EEPROM ID contains printable text, valid zero or 0xff
padding, and an R4006 prefix. Leave erased, malformed, and unknown IDs
unconfigured without changing the EEPROM data.

Leave the channel containing the BNO08x empty because no upstream
driver exists. Serialize topology changes with a private mutex and
stable device references. Retry transient setup failures, report
exhaustion once, and continue low-rate recovery so late adapter or
client availability can still complete setup.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 810 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 764 insertions(+), 46 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3d26ec1f7b9e..f2c2979daaf1 100644
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
@@ -347,6 +351,70 @@ struct ptp_ocp_serial_port {
 #define OCP_SIGNAL_NUM			4
 #define OCP_FREQ_NUM			4
 
+#define OCP_I2C_MUX_CHANNELS		4
+#define OCP_I2C_MAX_SENSOR_COUNT	5
+#define OCP_I2C_MAX_LED_COUNT		5
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
@@ -403,6 +471,7 @@ struct ptp_ocp {
 	u16			fw_version;
 	u8			board_id[OCP_BOARD_ID_LEN];
 	u8			serial[OCP_SERIAL_LEN];
+	struct mutex		eeprom_lock; /* Serializes EEPROM discovery. */
 	bool			has_eeprom_data;
 	u32			pps_req_map;
 	int			flash_start;
@@ -414,6 +483,15 @@ struct ptp_ocp {
 	const struct ocp_sma_op *sma_op;
 	struct dpll_device *dpll;
 	dpll_tracker tracker;
+	const struct ptp_ocp_i2c_profile *i2c_profile;
+	struct ptp_ocp_i2c_topology *i2c_topology;
+	struct mutex i2c_topology_lock; /* Serializes topology updates. */
+	struct delayed_work i2c_work;
+	struct notifier_block i2c_notifier;
+	atomic_t i2c_retry_count;
+	bool i2c_root_present;
+	bool i2c_resources_ready;
+	bool i2c_notifier_registered;
 	int signals_nr;
 	int freq_in_nr;
 };
@@ -444,6 +522,8 @@ static int ptp_ocp_signal_from_perout(struct ptp_ocp *bp, int gen,
 				      struct ptp_perout_request *req);
 static int ptp_ocp_signal_enable(void *priv, u32 req, bool enable);
 static int ptp_ocp_sma_store(struct ptp_ocp *bp, const char *buf, int sma_nr);
+static int ptp_ocp_i2c_notifier_call(struct notifier_block *nb,
+				     unsigned long action, void *data);
 
 static int ptp_ocp_art_board_init(struct ptp_ocp *bp, struct ocp_resource *r);
 
@@ -488,6 +568,68 @@ static struct ptp_ocp_eeprom_map art_eeprom_map[] = {
 	{ }
 };
 
+/* Channel 3's BNO08x at 0x4a has no upstream Linux driver, so omit it. */
+static const struct ptp_ocp_i2c_device ptp_ocp_r4006_sensors[] = {
+	{ "temperature@48", "national,lm75b", "lm75b", 0, 0x48 },
+	{ "temperature@49", "national,lm75b", "lm75b", 0, 0x49 },
+	{ "temperature@4a", "national,lm75b", "lm75b", 0, 0x4a },
+	{ "humidity@44", NULL, "sht3x", 1, 0x44 },
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
+	.led_mux_channel = 1,
+	.led_address = 0x34,
+	.led_riset_ohms = 4700,
+	.led_max_microamp = 8150,
+};
+
 #define bp_assign_entry(bp, res, val) ({				\
 	uintptr_t addr = (uintptr_t)(bp) + (res)->bp_offset;		\
 	*(typeof(val) *)addr = val;					\
@@ -1969,19 +2111,29 @@ ptp_ocp_nvmem_device_put(struct nvmem_device **nvmemp)
 	*nvmemp = NULL;
 }
 
-static void
+static bool
+ptp_ocp_has_eeprom_data(struct ptp_ocp *bp)
+{
+	return smp_load_acquire(&bp->has_eeprom_data);
+}
+
+static int
 ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 {
 	const struct ptp_ocp_eeprom_map *map;
 	struct nvmem_device *nvmem;
 	const void *tag;
-	int ret;
-
-	if (!bp->i2c_ctrl)
-		return;
+	int ret = 0;
 
 	tag = NULL;
 	nvmem = NULL;
+	mutex_lock(&bp->eeprom_lock);
+	if (ptp_ocp_has_eeprom_data(bp))
+		goto out;
+	if (!bp->i2c_ctrl || !bp->eeprom_map) {
+		ret = -ENODEV;
+		goto out;
+	}
 
 	for (map = bp->eeprom_map; map->len; map++) {
 		if (map->tag != tag) {
@@ -1997,21 +2149,536 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 		}
 		ret = nvmem_device_read(nvmem, map->off, map->len,
 					BP_MAP_ENTRY_ADDR(bp, map));
-		if (ret != map->len)
+		if (ret != map->len) {
+			if (ret >= 0)
+				ret = -EIO;
 			goto fail;
+		}
 	}
 
-	bp->has_eeprom_data = true;
+	/* Publish the EEPROM fields before readers observe valid data. */
+	smp_store_release(&bp->has_eeprom_data, true);
+	ret = 0;
 
 out:
 	ptp_ocp_nvmem_device_put(&nvmem);
-	return;
+	mutex_unlock(&bp->eeprom_lock);
+	return ret;
 
 fail:
-	dev_err(&bp->pdev->dev, "could not read eeprom: %d\n", ret);
 	goto out;
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
+	adapter = i2c_verify_adapter(dev);
+	if (!adapter || !try_module_get(adapter->owner)) {
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
+static bool
+ptp_ocp_board_id_valid(const u8 *board_id, size_t *text_len)
+{
+	unsigned int len;
+
+	for (len = 0; len < OCP_BOARD_ID_LEN; len++)
+		if (board_id[len] < 0x20 || board_id[len] > 0x7e)
+			break;
+
+	if (!len)
+		return false;
+
+	*text_len = len;
+	for (; len < OCP_BOARD_ID_LEN; len++)
+		if (board_id[len] != 0 && board_id[len] != 0xff)
+			return false;
+
+	return true;
+}
+
+static const struct ptp_ocp_i2c_profile *
+ptp_ocp_i2c_select_profile(struct ptp_ocp *bp)
+{
+	static const char r4006_id[] = "R4006";
+	size_t board_id_len;
+
+	if (!ptp_ocp_has_eeprom_data(bp))
+		return NULL;
+
+	if (!ptp_ocp_board_id_valid(bp->board_id, &board_id_len))
+		return NULL;
+
+	if (board_id_len >= sizeof(r4006_id) - 1 &&
+	    !memcmp(bp->board_id, r4006_id, sizeof(r4006_id) - 1))
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
+	int retries;
+
+	if (!READ_ONCE(bp->i2c_resources_ready))
+		return;
+	if (!READ_ONCE(bp->i2c_root_present))
+		return;
+
+	retries = atomic_inc_return(&bp->i2c_retry_count);
+	if (retries >= OCP_I2C_RETRY_MAX) {
+		if (retries == OCP_I2C_RETRY_MAX) {
+			dev_err(&bp->pdev->dev,
+				"I2C topology failed after %d attempts: %pe; "
+				"retrying every %d seconds\n",
+				OCP_I2C_RETRY_MAX, ERR_PTR(error),
+				OCP_I2C_RECOVERY_SECS);
+		} else {
+			atomic_set(&bp->i2c_retry_count, OCP_I2C_RETRY_MAX);
+			dev_err_ratelimited(&bp->pdev->dev,
+					    "I2C topology setup still failing: %pe\n",
+					    ERR_PTR(error));
+		}
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
+	if (!ptp_ocp_i2c_supported(bp) || !bp->eeprom_map)
+		return 0;
+
+	adapter = ptp_ocp_i2c_root_adapter(i2c_ctrl);
+	if (!adapter)
+		return -EAGAIN;
+
+	if (!ptp_ocp_has_eeprom_data(bp)) {
+		ret = ptp_ocp_read_eeprom(bp);
+		if (ret)
+			goto out_put_adapter;
+	}
+	if (!ptp_ocp_has_eeprom_data(bp)) {
+		ret = -EAGAIN;
+		goto out_put_adapter;
+	}
+	if (!bp->i2c_profile)
+		bp->i2c_profile = ptp_ocp_i2c_select_profile(bp);
+	if (!bp->i2c_profile)
+		goto out_put_adapter;
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
+	struct ptp_ocp *bp = container_of(work, struct ptp_ocp, i2c_work.work);
+	struct platform_device *i2c_ctrl;
+	struct device *i2c_ctrl_dev;
+	int retries, ret = 0;
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
+	retries = atomic_xchg(&bp->i2c_retry_count, 0);
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
+	mutex_unlock(&bp->i2c_topology_lock);
+}
+
 static struct device *
 ptp_ocp_find_flash(struct ptp_ocp *bp)
 {
@@ -2166,9 +2833,9 @@ ptp_ocp_devlink_info_get(struct devlink *devlink, struct devlink_info_req *req,
 	if (err)
 		return err;
 
-	if (!bp->has_eeprom_data) {
+	if (!ptp_ocp_has_eeprom_data(bp)) {
 		ptp_ocp_read_eeprom(bp);
-		if (!bp->has_eeprom_data)
+		if (!ptp_ocp_has_eeprom_data(bp))
 			return 0;
 	}
 
@@ -3758,7 +4425,7 @@ serialnum_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct ptp_ocp *bp = dev_get_drvdata(dev);
 
-	if (!bp->has_eeprom_data)
+	if (!ptp_ocp_has_eeprom_data(bp))
 		ptp_ocp_read_eeprom(bp);
 
 	return sysfs_emit(buf, "%pM\n", bp->serial);
@@ -4729,6 +5396,8 @@ ptp_ocp_device_init(struct ptp_ocp *bp, struct pci_dev *pdev)
 
 	bp->ptp_info = ptp_ocp_clock_info;
 	spin_lock_init(&bp->lock);
+	mutex_init(&bp->eeprom_lock);
+	mutex_init(&bp->i2c_topology_lock);
 
 	for (i = 0; i < __PORT_COUNT; i++)
 		bp->port[i].line = -1;
@@ -4867,6 +5536,11 @@ ptp_ocp_detach(struct ptp_ocp *bp)
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
@@ -5081,6 +5755,8 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_disable;
 
 	INIT_DELAYED_WORK(&bp->sync_work, ptp_ocp_sync_work);
+	INIT_DELAYED_WORK(&bp->i2c_work, ptp_ocp_i2c_work);
+	atomic_set(&bp->i2c_retry_count, 0);
 
 	/* compat mode.
 	 * Older FPGA firmware only returns 2 irq's.
@@ -5095,9 +5771,21 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
+
 	err = ptp_ocp_register_resources(bp, id->driver_data);
 	if (err)
 		goto out;
+	/* Publish all board resources before I2C topology work can run. */
+	smp_store_release(&bp->i2c_resources_ready, true);
+	ptp_ocp_i2c_kick(bp);
 
 	bp->ptp = ptp_clock_register(&bp->ptp_info, &pdev->dev);
 	if (IS_ERR(bp->ptp)) {
@@ -5191,46 +5879,84 @@ static struct pci_driver ptp_ocp_driver = {
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
@@ -5244,21 +5970,14 @@ ptp_ocp_init(void)
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
@@ -5269,7 +5988,6 @@ ptp_ocp_init(void)
 static void __exit
 ptp_ocp_fini(void)
 {
-	bus_unregister_notifier(&i2c_bus_type, &ptp_ocp_i2c_notifier);
 	pci_unregister_driver(&ptp_ocp_driver);
 	class_unregister(&timecard_class);
 	ptp_ocp_debugfs_fini();
-- 
2.50.1 (Apple Git-155)

