Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513767;
	b=YdbY8ALbQXDSSgWWgUbP8RfeFtbqNUEPplKm7zDSuCMZNsevyLew9JmO7s82wMgECAe3
	 WkYgRgLIriTUZvgcR7Afa2S7LAS3G9RUs0GihpDLM2/O80WZJyQoHB0tqPjmRgfLZsBNr
	 O3fiXsfc2CNJCQefBmGIfBxf2hMOneIQT7mFrbp9IJIoQbJb/QesqsEIeonLkRBR5fZZ9
	 uOkvtPxwz4m9Q1scybdkOSwk8RAEEaUZQ4QzxxVVW0pMlPtLddCNf85pnqjgfl4FQ0nWT
	 9RNb3YavGmZPt6KBtSKywqXWFjmrUVbkUugf8ILxhvo8AZL+4JJtrhnwj0P6vcUtaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DkUdx+bUwo5qwgK+grdLsM2d8mplreNkxSaC5tCB7g0=;
	b=mLsU83iN7ELPl3S4xxobQzRPx/Sevq1a9/+ZF6lzoNSivHUbzsNgISqLFMQIZdsNbLVJ
	 A01WeEMaSTYXzQKnNjyU5Ew77m5/2SmsMjBYuQruqFvtjtghSDipiGT6fzgMqqzp6vmLl
	 G57EGr3kZcT8Ck70gNzNFGv3j7LoP9+Bkm3D3ta2iHngtKaIDSSW6ieHyyB24KTpwCw0K
	 A9Kpo1/XM/BKKjsRHGOpPR06UpVrc+qRzxbjKjPvGozhWZMaHvnc4OxSULSS/gXrt9qiv
	 b3VPPVqnCtSM1UrTMaDvU/Ztt2wFP6/p6OtI7T4nV4dBTIwHiFRG64gszZobIbGpLGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJAci2j;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3142606B79A
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 09:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3142606B79A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJAci2j
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c08539c827so3224395e87.2
        for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 01:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513764; x=1796118564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkUdx+bUwo5qwgK+grdLsM2d8mplreNkxSaC5tCB7g0=;
        b=yYJAci2jncSbB3eMAO+ZfTDnDvTAIyPIHDsxC5GjgnSTypk3xWtuzAiv4OjJEsw18+
         lA8OTpNafy/tj+w/wr4ViXH29dWJqr/sPSw3NLc/T7j3OJA5xSoFHINvFCW1nzQ/wbU2
         s/sfuA/zMkEUjzv8yWdnX2ryelXbVuCqAQXJVOjN0T27jWpeG3eQAdvBpuFSYd2iCs5D
         cxR1o7O365eiqRHMXjWT+jZwoeA8Nyn7bxALiC0ILDvaChGrqYNxf3U3uwWJieUIMh7t
         pz3fiqfY0UARduOHqJWji4AcVee0soyaEmkNe7Odv+JcbEb+UG04sNKQsm57TJvgBuVF
         n71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513764; x=1796118564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DkUdx+bUwo5qwgK+grdLsM2d8mplreNkxSaC5tCB7g0=;
        b=kvfr2ejQQK6xsIOcqFYvYsl+uXL+crRCxsDxOuCzDi4r1l3j1jOfNjx9EpLe+SQ+6o
         McyhYP0CSR8U052cDfjbya/hGHYq4WqTbGhbVcE+5CCChATuHcaUyr3TFLZB/Ey6JAs3
         DuIQGx5q94OuT87PAJOGlkBRblt+qgLPcPA9ZVPo7YTkLpH06LiTDFOrzmgdpoLJp8pP
         LtBvocyfmsNiXdsd66tAGCRKwfroqIdesLR1IsfptmT1E0BLLhesaMSd1fzuPRseCAUa
         X0XCNmlFZbLprwMYzsNJQsxtjPrDIgjIopU4+IekUswfWwCN3SaY8Vs/qve6SysP40/E
         t76Q==
X-Forwarded-Encrypted: i=1; AL+hErGT/QyOUM5433hz3GaB6lw2F4up1D6AalNYHqHDfhePnr9Kb2eyb9cs6rct816Kn7p4pY/Ek3AkcjrA@vger.kernel.org
X-Gm-Message-State: APuU4Z/d1rjiX1ttdm30KHSObGWTDV8ZHCba3KmOypa/Me0VkIuIAjh8
	GAS+4fWXZqjjNRFKvkjROO+CU9trLuhvWNzC/tFtztOvieJZujOXDUAT
X-Gm-Gg: AZFdTZf+ABomz7NJ+XvuJSZGHEB8mCE/xgT4r+YsZTn0Q9XdwNz1IPGbVu9at8agXEu
	WPHVmYtnt1lXkWmIvhk/Isxlh86P9+6Xb49VMm5yOykv8rbT4uJinZ49h7LQA0KabDhSqgF4OEc
	bUy7hZ2HBwadE4O9EF4juJ/VXwnnYZ9LfSdTebQLC5N/aLw4E4Ya2S2OOFnWHQmyyN1mUPpUS5P
	IYaNGiCbr6PKByZeaBj897xB0Aju1vEhg0ZdJyK/Lwpeq4Z7x2oH1Ctv0p4l/HKtIsFQ6zLV+S/
	e6jkNd7WhRv1swGz0sRxjCrlFje+l3BfUXtU12zqX47ghJS5vWkjcONygkJ7Yk4iAjNnlYLrBii
	xoHRE5ssZCWSqG2Lh4OxJo4RGjQq3AtTprzPn4YB/04rq6GvTdbiv674SU8bDn7QyKcHKgpJoY0
	NulwlZebjgLO36T9pNKBe1l/3JzmXHWUiu1xKqM168iBmfMkokmqj6rhPfYIPpGu0HGBwF3gDIp
	vxkTILxjQ6f1ppS6ddFDjBNEqu+/hW+KMDRE5ACeZwTdNW8S9QCTkKuz3EMQThCRyWFpLQp1hMQ
	FztXrh2PLMoKqx7eCJoA7HA+T+k1nbNLhJRIZuX12LwYbzs=
X-Received: by 2002:a05:6512:ba5:b0:5bf:cabe:23b5 with SMTP id 2adb3069b0e04-5c1bc8a1668mr3757642e87.60.1795513763924;
        Tue, 24 Nov 2026 01:49:23 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:23 -0800 (PST)
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
Subject: [PATCH net-next v5 3/3] net: phy: dap8211r: add PHY LED control support
Date: Tue, 24 Nov 2026 12:49:12 +0300
Message-ID: <20261124094914.2993988-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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

Add the dap8211r_write_ext() helper to access extended registers via the
PHY indirect access registers, and implement callbacks for:
led_brightness_set(), led_hw_is_supported(), led_hw_control_set(),
led_hw_control_get().

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 259 +++++++++++++++++++++++++++++++++++++
 1 file changed, 259 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..9b65b5c57de8 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/ethtool.h>
 #include <linux/kernel.h>
@@ -57,6 +58,56 @@
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
+#define DAP8211R_LED_SUPPORTED_MASK	(DAP8211R_LED_ACT_BLINK		| \
+					DAP8211R_LED_FULL_DUPLEX	| \
+					DAP8211R_LED_HALF_DUPLEX	| \
+					DAP8211R_LED_TX			| \
+					DAP8211R_LED_RX			| \
+					DAP8211R_LED_LINK)
+
 static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
 					      1050, 1200, 1350, 1500, 1650, 1800,
 					      1950, 2100, 2250};
@@ -87,6 +138,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
@@ -114,6 +190,185 @@ static int dap8211r_modify_ext(struct phy_device *phydev, u16 reg, u16 mask, u16
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
+	ret = dap8211r_write_ext(phydev, led_reg, led_mode);
+	if (ret)
+		return ret;
+
+	return dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON,
+				   DAP8211R_LED_FORCE_EN(index), 0);
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
+ * Return: 0 on success, -EINVAL for an invalid LED index, -EOPNOTSUPP if the
+ *         current hardware configuration cannot be represented in rules, or a
+ *         negative error code
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
+	if (led_mode & ~DAP8211R_LED_SUPPORTED_MASK)
+		return -EOPNOTSUPP;
+
+	if ((led_mode & DAP8211R_LED_LINK) == DAP8211R_LED_LINK) {
+		__set_bit(TRIGGER_NETDEV_LINK, rules);
+	} else {
+		if (led_mode & DAP8211R_LED_LINK_10)
+			__set_bit(TRIGGER_NETDEV_LINK_10, rules);
+
+		if (led_mode & DAP8211R_LED_LINK_100)
+			__set_bit(TRIGGER_NETDEV_LINK_100, rules);
+
+		if (led_mode & DAP8211R_LED_LINK_1000)
+			__set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+	}
+
+	if ((led_mode & DAP8211R_LED_RX) &&
+	    (led_mode & DAP8211R_LED_ACT_BLINK))
+		__set_bit(TRIGGER_NETDEV_RX, rules);
+
+	if ((led_mode & DAP8211R_LED_TX) &&
+	    (led_mode & DAP8211R_LED_ACT_BLINK))
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
@@ -202,6 +457,10 @@ static struct phy_driver dap8211r_driver[] = {
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

