Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162279;
	b=hKu2570fnQDUos9lwrlnv1/9ekLjhCxesHge+EB282IBtI1UCjI4Qd+0746jdHwc1yO0
	 y9O2W0Qrrha5JJQryS7DiuF0uqbZ6sp82xWx67j/LZWzGMwJlFjcfOVZ22QNLbSzeZKFU
	 +RTmaMGxDa1JoeQBsF84Su8RtKhwxs6HGgpyXTQyM0lHZu01a+4hh1kqL6R1Ygxm800s+
	 v1Tbemr1VLuegRCep17qlZZ3P0qlryB3Ag9y0/fslkJUgaugyzbMamCKKsXvkEl5CDs96
	 SOMxo3dPv/0umcpi/AKYwgQP2ReDNSyl2v77XsVFjm2FBeIx79UuRIDVqqWiun2/9+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GLTEhXxrmN8coLJWucp8fFY/jceHUAmhcGiMuOyr+Bw=;
	b=tZMbn6Jm6InH67iQO2Uu0ZTjApHjc4d4Vd08x7aDQHeWMRm3tUvQJFpZzJj30a+69Dgy
	 sjr0QBynwMi1mtTGUHovZ+Z9yd7cH6EyjjQl/TiVetdzs9a4wyrAzUWFZF0fHcWMkNqfz
	 btUn7E/yDOF2bU8VSHEBrzpmFJnkh9Ay5Y4dlat0Tb9nv+5Gv8c3l9cfbSrb6dp6y5wZj
	 4Lvxsnte5SEd5gjzoJFCdclmyG/EKOiWAUSWa7LNWi/zbV7/Xh1DluEwVb61lr6Lq4+qn
	 Afni1BlJXT7guuVoAQeJPtSUWM4YGtKlvrXvNc5XqWXDjinJ/QRYwMyzc8915stiXUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxsPbRcu;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFDC606A332
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFDC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxsPbRcu
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso839378e87.3
        for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162277; x=1795767077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLTEhXxrmN8coLJWucp8fFY/jceHUAmhcGiMuOyr+Bw=;
        b=YxsPbRcuV/l+/JvljlytWzU2sXS/F3iac46dpyDAZtW300u9oogxHTx65mysM0H1CQ
         4anLmb+HnBGtjdOEiw0b1w+4f66oEWkDhNyNq0oYlpYNv0LPNrR0Zq/a0B+VvYNxtmoz
         8LgdvC4VWRQYbZghQsslqqnWuaEzxsv/acA1Z2AOK2sHUdsIXWPqsPhTMgBw8SDrBA28
         QbiD+YzIDpOblPMehE4BumMr4lr/c+7wIMNGpMibtU/zHHt4BgBZFUIjTp5Rg0qBTVKj
         fK+UGW/i+tRtU8rMsBlHDQFkeNA2w4r3A2HDoJjQEeFNZcV8mKD9D5nyXpViRm+sIV7w
         n/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162277; x=1795767077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLTEhXxrmN8coLJWucp8fFY/jceHUAmhcGiMuOyr+Bw=;
        b=I1wwCT+V95dWgCNidAZ9OcVKnphXWX5TPLGrOyg339+QVb+MgrsbIJfL9rV28EYa8L
         tey6bnrVVHGX4h6qfRZy0BEPDjlB/aG8hSNPugNckFXDF7Oo38xGKESsYoWn0KAonJw1
         rsC6s3io1lhXdn2b7qwVZBl2mUuKy2syNblcVSrSJ6snhb+fkLXrtdU/k2qtSSuWa9jM
         SS4ybnZwV/f4uIdGZlY+gDLTBL7B1atztckyZAe5BVrqYfCS+kfDXJ4YMYc42uVrzPyP
         PAyktFBGjn3Ol2vzvVfbDB7hHC86jCPtKIDWna3bkiTRW1Ii5NzNbBRD68mQQUoCXJ6V
         Pcng==
X-Forwarded-Encrypted: i=1; AL+hErF/b+2bvJmq1gSkl/tAGft1oOtKEAL3JNI4p1WkecVNXdX8I6OzQloREJYFfKM4d5pXn9qEUjL7JFfZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8DGGbxZmbl43CqsOs5kTwgS64o+fQ9BAYG/JmDZ6LsFs4y08bX
	WYe10ufoowGiyTERAc4hzRjGEu+wOq4Pd5OOobTQMEM8xro1MGd/rcKp
X-Gm-Gg: AZFdTZcK7L5gH02ICXz1D/3AL86DYo44CiLDa+5SoNMSE6glCWOhBjmtwfuBq0JKJLi
	Slqees3nvwrTwrbO5CZNFTzi4b5CiFTIuhmFEkEYX7mpc2xJI5Ak91OBIl6+ykPFt1NkYTzQ+Xb
	c6l8j7Db6FbFfOTDI6I31QfI464WUYfXH//2D3sIpLj1NcAdSXFyXn+LoDchsUljiQRunXN6s9P
	mlw5YgvaM5U30h9MHPyr0NV2rLSaJCfw9DvUfZoBNMAI20JTWkbj5AkLg18YWwR4OH98BNCBhWQ
	fhQu8rzaHkczvYavA7gfFsrSscc2vMFV0cJGoPYjUbd+1ktC2NeS+akGoXkopT6CTq/Bex1d9dg
	PqH0OU0FX8h5KxnzjR3soFpSoyCtN4B5UZxNVOQqMaKV6AgCA/G0qW+AIY35kDp/qLXB75uPNuo
	Os07uUomciNnbFka0a5cb8/syzwWzpYaolAFdXmj7RbMNO74v8v1udxt+ysG5HV+Mavqw7GqFvH
	qcnhdCVuW1JAEHb+h05dq4HM9fvw2Vj5BzM4SyF168OKuMJ3XCY3cqoJch3lHsXBxXukE/+9GYA
	4sHemj+hESGfplOiJi527d5vntBPThrXUAwExDYQwtaPlag=
X-Received: by 2002:a05:6512:2255:b0:5bf:a349:d8d2 with SMTP id 2adb3069b0e04-5c1bc85bdb5mr680791e87.45.1795162277072;
        Fri, 20 Nov 2026 00:11:17 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:16 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 4/4] net: phy: dap8211r: add PHY LED control support
Date: Fri, 20 Nov 2026 11:11:02 +0300
Message-ID: <20261120081106.2919010-5-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for hardware-controlled LEDs and brightness on the DAP8211R
PHY. The chip exposes three LEDs that can be programmed to react to link,
speed, duplex, and TX/RX activity or be driven via the force mode.

Implement callbacks for led_brightness_set(), led_hw_is_supported(),
led_hw_control_set(), led_hw_control_get().

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 215 +++++++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index f626b43fdee1..b0fb3cf89b55 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/ethtool.h>
 #include <linux/kernel.h>
@@ -57,6 +58,49 @@
  */
 #define DAP8211R_DEFAULT_DEL_SEL	0xD
 
+#define DAP8211R_LED_ID_0		0
+#define DAP8211R_LED_ID_1		1
+#define DAP8211R_LED_ID_2		2
+
+/*
+ * LED_COMCON force mode bits, per LED:
+ * bit 2 - FORCE_EN (enable force mode for this LED)
+ * bit 1:0 - FORCE_MODE: 00 = OFF, 01 = ON, 10 = blink mode1, 11 = blink mode2
+ *
+ * Only ON/OFF is supported.
+ */
+#define DAP8211R_LED_COMCON		0xA00B
+#define DAP8211R_LED_FORCE_MODE_EN	BIT(2)
+#define DAP8211R_LED_FORCE_MODE_MASK	GENMASK(1, 0)
+#define DAP8211R_LED_FORCE_MODE_ON	FIELD_PREP(DAP8211R_LED_FORCE_MODE_MASK, 1)
+
+#define DAP8211R_LED_FORCE_EN(idx)	(DAP8211R_LED_FORCE_MODE_EN << 3 * (idx))
+#define DAP8211R_LED_FORCE_ON(idx)	(DAP8211R_LED_FORCE_MODE_ON << 3 * (idx))
+#define DAP8211R_LED_FORCE_MASK(idx)	(DAP8211R_LED_FORCE_MODE_MASK << 3 * (idx))
+
+#define DAP8211R_LED_0_CON		0xA00C
+#define DAP8211R_LED_ACT_BLINK		BIT(13)
+#define DAP8211R_LED_FULL_DUPLEX	BIT(12)
+#define DAP8211R_LED_HALF_DUPLEX	BIT(11)
+#define DAP8211R_LED_TX			BIT(10)
+#define DAP8211R_LED_RX			BIT(9)
+#define DAP8211R_LED_LINK_1000		BIT(6)
+#define DAP8211R_LED_LINK_100		BIT(5)
+#define DAP8211R_LED_LINK_10		BIT(4)
+
+#define DAP8211R_LED_LINK		(DAP8211R_LED_LINK_10	| \
+					DAP8211R_LED_LINK_100	| \
+					DAP8211R_LED_LINK_1000)
+
+#define DAP8211R_LED_SUPPORTED_TRG	(BIT(TRIGGER_NETDEV_LINK)	| \
+					BIT(TRIGGER_NETDEV_LINK_10)	| \
+					BIT(TRIGGER_NETDEV_LINK_100)	| \
+					BIT(TRIGGER_NETDEV_LINK_1000)	| \
+					BIT(TRIGGER_NETDEV_TX)		| \
+					BIT(TRIGGER_NETDEV_RX)		| \
+					BIT(TRIGGER_NETDEV_HALF_DUPLEX)	| \
+					BIT(TRIGGER_NETDEV_FULL_DUPLEX))
+
 static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
 					      1050, 1200, 1350, 1500, 1650, 1800,
 					      1950, 2100, 2250};
@@ -139,6 +183,173 @@ static int dap8211r_modify_ext(struct phy_device *phydev, u16 reg, u16 mask, u16
 	return ret;
 }
 
+/**
+ * dap8211r_led_brightness_set() - Modify the LEDs common control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @value: ON/OFF value for force mode of the LED
+ *
+ * Enables force mode and sets the LED to ON/OFF state.
+ * It will be disabled when hardware LED control is requested.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_brightness_set(struct phy_device *phydev, u8 index,
+				       enum led_brightness value)
+{
+	u16 set, mask;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		mask = DAP8211R_LED_FORCE_MASK(index);
+		set = DAP8211R_LED_FORCE_EN(index);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (value != LED_OFF)
+		set |= DAP8211R_LED_FORCE_ON(index);
+
+	return dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, mask, set);
+}
+
+/**
+ * dap8211r_led_hw_is_supported() - Check if the requested LED rules are supported
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Validates the requested combination of rules which can be represented in the
+ * hardware register.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index,
+ *         or -EOPNOTSUPP if any requested rule is not supported by the PHY
+ */
+static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return (rules & ~DAP8211R_LED_SUPPORTED_TRG) ? -EOPNOTSUPP : 0;
+}
+
+/**
+ * dap8211r_led_hw_control_set() - Write the LED control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Disables force mode and translates the requested trigger rules into
+ * the corresponding bit positions of the LED control register and writes
+ * the resulting value to the PHY.
+ *
+ * Note that the ACT_BLINK bit (13) must be set together with TX/RX rules,
+ * otherwise the LED will not blink on traffic if no other rule (such as
+ * link or duplex) is active.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	u16 led_mode = 0, led_reg;
+	int ret;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, DAP8211R_LED_FORCE_EN(index), 0);
+	if (ret)
+		return ret;
+
+	if (test_bit(TRIGGER_NETDEV_LINK, &rules))
+		led_mode |= DAP8211R_LED_LINK;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
+		led_mode |= DAP8211R_LED_LINK_10;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+		led_mode |= DAP8211R_LED_LINK_100;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+		led_mode |= DAP8211R_LED_LINK_1000;
+
+	if (test_bit(TRIGGER_NETDEV_RX, &rules))
+		led_mode |= DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_TX, &rules))
+		led_mode |= DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_HALF_DUPLEX;
+
+	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_FULL_DUPLEX;
+
+	return dap8211r_write_ext(phydev, led_reg, led_mode);
+}
+
+/**
+ * dap8211r_led_hw_control_get() - Read the current LED configuration
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Pointer to a bitmask where the current rules will be stored
+ *
+ * Reads the LED control register and translates the hardware bit
+ * positions back into the corresponding netdev trigger rules bitmask.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 index, unsigned long *rules)
+{
+	u16 led_reg;
+	int led_mode = 0;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	led_mode = dap8211r_read_ext(phydev, led_reg);
+	if (led_mode < 0)
+		return led_mode;
+
+	if (led_mode & DAP8211R_LED_LINK_10)
+		__set_bit(TRIGGER_NETDEV_LINK_10, rules);
+
+	if (led_mode & DAP8211R_LED_LINK_100)
+		__set_bit(TRIGGER_NETDEV_LINK_100, rules);
+
+	if (led_mode & DAP8211R_LED_LINK_1000)
+		__set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+
+	if (led_mode & DAP8211R_LED_RX)
+		__set_bit(TRIGGER_NETDEV_RX, rules);
+
+	if (led_mode & DAP8211R_LED_TX)
+		__set_bit(TRIGGER_NETDEV_TX, rules);
+
+	if (led_mode & DAP8211R_LED_HALF_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+
+	if (led_mode & DAP8211R_LED_FULL_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+
+	return 0;
+}
+
 /**
  * dap8211r_config_init() - Initialize PHY
  * @phydev: PHY device structure
@@ -227,6 +438,10 @@ static struct phy_driver dap8211r_driver[] = {
 		.config_aneg	= genphy_config_aneg,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
+		.led_brightness_set	= dap8211r_led_brightness_set,
+		.led_hw_is_supported	= dap8211r_led_hw_is_supported,
+		.led_hw_control_set	= dap8211r_led_hw_control_set,
+		.led_hw_control_get	= dap8211r_led_hw_control_get,
 	},
 };
 module_phy_driver(dap8211r_driver);
-- 
2.43.0

