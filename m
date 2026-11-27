Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761448;
	b=EEcBEXLv/Z/v7nWAZwmMg/KIzJ0KAt5EIk2C6Z8tUrxRisAcsyRZKXBoxAjQFghre9Ae
	 WuS0abapK0dgSHkHv448DBD3pQYjL8pECUte4YLk7x67EvFI3fesYDi6g3S75PCNV2Jk6
	 c8p9SJ3LrDCmSKBr3TbEfO98FlOZGiaixewbcEFDf12a/lEcodBAhHc+uLTkugnL/+g4H
	 Fj4YtoNirxgeS7A5kNKwsbkbBS+fOxKXQxwXW8Z5/1pKF5tmdijKtll1EJpoSiijAXTSB
	 5kIR39iLeTvzcgrE/SD2ovXMPIxm3DuG3kXBUfwSPNcEYan9bdBOIEY0NcCW2QBHKPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ouFPTWJhXr8TTmjO4pfxOnzGc0miXfirhT0XeCsCiFY=;
	b=RA9CC0O82i4ay2uxTOhhRgFkmgy5V7IipiDD/a10RgQjjuL5qOI5AdgmNow/kkONHm4y
	 EWqgKP/J9SgYH9agmyAiL7cJz2P4szIgVdbsL5j5eqvzKAzWwgiuFH3DI6rk5yUPatoj3
	 PZv1usoVBFAQYN4riarvr0Ib3YPwumLaLL03SNfmTWzNb9TBEy6+BmwZ0dKIFbe7H9xbJ
	 WWhJ9EU4+KOICHJYD0ZNm04SdvUXH2gRSO71+cbGKwbEFqTYGxjb/7544pn1rat6iGD6i
	 4ytYYmwcDS0teQB6pTgVmoJnPBJmX3eNiwDz2rKHgq7j5pT2XR75jEq1X8egEjTfEFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejt1OiXS;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4D606A32F
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 06:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA4D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejt1OiXS
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c31cdbeec9so2702293e87.2
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 22:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761446; x=1796366246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouFPTWJhXr8TTmjO4pfxOnzGc0miXfirhT0XeCsCiFY=;
        b=ejt1OiXS6TGkz5nOvbhO4FJrfLcTWb/7xMm7PRKPenH2EOTSwcVSX6QQNvM8sBincD
         PonAoKVbQs3aNHNZuNeLaAxuRnCuCFu/dEhaslarw+FrNooBywWG+ZQsMDOn8aHutmMd
         QauZtV08VJSSg3lbKBxRoBnrij42Q1kHv9XJz/+CUyEZ/FC5+h49RtmB9ZYI5Z73Nkja
         8/Sjy8ZEnFm0FeS1xXlqkLYQAHSmLiGPGH4uKTVCq3Sp5ae1+fS/AgXaGTDF77MT8M6x
         SO/2k19zhAbYmrZglrLaY5i3tJhahxbhg/RYjU9nc05qI/kfCD8e42qyGNsJ3Xyi7bwy
         MSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761446; x=1796366246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouFPTWJhXr8TTmjO4pfxOnzGc0miXfirhT0XeCsCiFY=;
        b=cGJUqHHCda0Ol9nQ6W7DESBfy4WFG1Ku40kQnkOR6hVD0rVY+Q3pyvYXC6yQ1ydC4W
         LPvRw/DeaUqhGqbFNOyhOkGD9kIiH5f5zp8IwUpdf4tEEL8TJ8+l82FOJj7xEaDgV3qg
         SpUpdd5z/lbE0+mN2+fav7cCm5mop1lD+gBvwHj77x22+ny+Q76MpLkAO+TwfF4atQnL
         1tek8dZYLd7RHa91fuWv6CY9Lby8yda7rLQ6+XgHHWg4BJApB4ohrx3B/WE6CM4TmH7y
         YhliQtsQPTAX9Du8UO8c0qGWv5gau2YmiHi9+EPS55dhmxXjjx6WD0x8qi0yeLK7NhHd
         uw2g==
X-Forwarded-Encrypted: i=1; AL+hErEPcbhhdf2L58dIlQtl9iFSvuSvH3zH0Pl1IYCXFer/iWQslgcYTc/nS2MHiZ6WqF1z0+BaA6/K+xQV@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZMSunTJ83NV6cnWAcV9AFSzTzfK0pFb7+TiSkMTWGGtiHBytW
	kZ86qUNdy9wTfLN0TwNORHtxVoTmmamAN95qteMKOMdyFGBUA1yVoaGO
X-Gm-Gg: AZFdTZcVelZqSuU66iG+S/cdlj6HaCDvUfvg1MUD2UxFxXIZlZSNy8vtZpis/M623Ur
	A6kUvef2a7qKwtJbRGZDYJ7i1fIuqMAFil5b9H07cdtfoBwhS+l5bYFR9VtzdKaRkT3J3k8x/qQ
	sZGLuuOeCWDtnwYeZ4kS2pllykVxTentbRNSw4KLFTzhx8n63iOP9tln9y2B4QyrvzQL1f1J3YB
	EezWwtninbu/IHCtF2opMOeRXbCj9OpyUXth1i8T2OiACswUMc9V8sQ5D9lPxsrLNs+MoBl+I58
	6bqbCrGJJz9h+sY0HHN10I01UVM2t8R+zZBA5elD6zmbucG9Gz1SDDk+FI1IBcOZygOqYrKSCTZ
	WD+T8ukyeNtgydS7LLzGvAt6ERZdCcyh6x45DiduYMoIh7NibdCse0O1J/kCEDPyLByFUGrTi7U
	mTwitzumIKiGsysd935IYogTM78E4VHgxmcPBTjYuc+Mk640mbEauDl3u9RLeEEeKg2UIxM/zSJ
	NwzmBXVTSEJ0K+RkrSLKSrBDJ5PACuV+UnYQwdvFEgKupN1NSBRzyxCE61MxWd6sbo3l0ARu8fg
	Gi/svuB4EvDps71xmRPWeK6dwAiteg==
X-Received: by 2002:a05:6512:1585:b0:5c0:4e3:a416 with SMTP id 2adb3069b0e04-5c1bc68009emr6417631e87.1.1795761445656;
        Thu, 26 Nov 2026 22:37:25 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:25 -0800 (PST)
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
Subject: [PATCH net-next v7 3/3] net: phy: dap8211r: add PHY LED control support
Date: Fri, 27 Nov 2026 09:37:05 +0300
Message-ID: <20261127063708.3074433-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 270 +++++++++++++++++++++++++++++++++++++
 1 file changed, 270 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..c6d18312c8c3 100644
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
@@ -114,6 +190,196 @@ static int dap8211r_modify_ext(struct phy_device *phydev, u16 reg, u16 mask, u16
 	return ret;
 }
 
+/**
+ * dap8211r_led_brightness_set() - Modify the LEDs common control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @value: ON/OFF value for force mode of the LED
+ *
+ * Clears the LED control register, enables force mode and sets the LED to
+ * ON/OFF state. Force mode will be disabled when hardware LED control is
+ * requested.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_brightness_set(struct phy_device *phydev, u8 index,
+				       enum led_brightness value)
+{
+	u16 set, mask, led_reg;
+	int ret;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		mask = DAP8211R_LED_FORCE_MASK(index);
+		set = DAP8211R_LED_FORCE_EN(index);
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (value != LED_OFF)
+		set |= DAP8211R_LED_FORCE_ON(index);
+
+	ret = dap8211r_write_ext(phydev, led_reg, 0);
+	if (ret)
+		return ret;
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
+	if (!!(led_mode & DAP8211R_LED_ACT_BLINK) !=
+	    !!(led_mode & (DAP8211R_LED_RX | DAP8211R_LED_TX)))
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
@@ -202,6 +468,10 @@ static struct phy_driver dap8211r_driver[] = {
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

