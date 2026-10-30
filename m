Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397579;
	b=f62UfDc0fA3Hkjef6Zl41MmSo456+QBto0rO4OMeGvPHdNkCb8KYCllqLZHHBjQ6MlcS
	 cZ8EAjuL6XGcdeEyt4mPZxUVRpd2xLvWqnMepM1H9T+4/GHt/9QEm/VkQYZxQqUx20cg1
	 BU19ULLIMW7PpGlH9lnIVOiDqIjEKdvRey++wS3FmQqDENDmuf5aZgxwJ4a43ia+76gKT
	 iHoonDSCp4vgrRpmaJXyUvUUafKeyf7yl8LDW+ULDZFGcCPw5W64wviGcEmfSwF4pjCDs
	 t8AMVutrHRV0eCP7I38pln4a8SLRJh35G4qNSL6NBuAJ06w+qLmkhRIchvK7id5uIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LaJ11rRvNM7F5mpfLmNq4MiUzrRFshUKgjdjahPHWq4=;
	b=AxKzNoAvlom3pETToRVeTc+4fz0+DbMULrwe1kCj52petYuUqvg0yO6v/XHs6AvK6eH3
	 w7FdaUb8Am/+Wtg+sn462NEm++2wUc8BAqxOAkwRWdMnFNs3o/BFM2lU0bIqsG7IfpuRQ
	 5hY8ao5+Cb0NC08zokR3zFcYXbKlO4RHNnFkY+t7W8nTkOoNU4RKQxpkksOOUWqJB2MWd
	 yU4uiHa6a47tbcdCNrF9KDTrNIlWsifg5kY+RLiJ2d/SmM/bDri+GXLYDaxSpzPAGP7tR
	 m8mEQems5TNIMEkEpsNRCUFez2ob0b0qZvyM9H3jFFqm2FgmRqI5i8LjH9Iy31rSxNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bVGU+BPq;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9D606A31C
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 21:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bVGU+BPq
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so12565895e9.2
        for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793397577; x=1794002377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaJ11rRvNM7F5mpfLmNq4MiUzrRFshUKgjdjahPHWq4=;
        b=bVGU+BPqpqRoun2/Z+snr9OGRlOyab2c0bnbATOkzoOgLgkCnDqq0ZpmnYkWzsWdMt
         MdzbJxJA2agsIRYQTVVDST3BqvoGsWbTxnIM6M2opdA+kKbWqmrTfOb5c/lTV4IZKgrs
         X8kHySX07NX8/HqGnEECfIgAB/QwmIO38xtgqcN+ajFSPWfgX0q29vYeSMsVntZs4gGb
         1JJWcVqjFoJ0OScRx0aOt3lFhs3RgMUOEGVqQf1XcJgbX0MFkeMOUh6mN/YKQuW4qjZI
         YmIGbp6FC/SQDU6zvIxcPwx+p0PzPM2sBkESXSNuWD9PUJS84Jr5yEJZhIsTBm9+VKXx
         wzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397577; x=1794002377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaJ11rRvNM7F5mpfLmNq4MiUzrRFshUKgjdjahPHWq4=;
        b=D3y/HdYPizDZ3hUv75ztpkKPo0F9ofRGN1FFJ269xvX1im1VRSHPBxBNHI3NWFo0Kf
         a2TFAgsVXDhqgK00/3FrCNhRZrOG9bIj0xGwrYAMfUSMq2vtaNpUgdpn1ZjBd2hciSmM
         Je/wIq8ioS+TxeU404Z1WlEIhgsFiQ+I98JRIt5I/qxTx0ZmpYwLbi4wO6c1Zi2cvZKs
         Q1Ap4tnBjPxu4z1V+7pbehbilPepCoqfsbZp8DaNHlL3jSdUS8r62Ui2k4M+oF6wFL6c
         5uQUjWmfNiVnXLLlA+54s25J5/yPUc27ku4OIUECjzQWVSnj6P01eS4YHBSETrlS+vNj
         eo+w==
X-Forwarded-Encrypted: i=1; AKwUvBzz4GjY7GsEymILR+2a+7wi7rFTDg97j+mbAQsSdcQ1w/MDhHBLpI539/0l34knfSiJZtbQkmwD5E4c@vger.kernel.org
X-Gm-Message-State: AFq9FYJXg05KcpJAyIlSp0jI35hTYwzfcAYDbjlMXRGaIQNhqZC8PVYM
	BQ8pO7xL5j+JOYsNBwzKO0h3SvQYmiXTmkddLM4Z5YywJw4idTp8TXLF
X-Gm-Gg: AYBFou1+t6iG2MyESEIt8hboAn7XkRw6/OnNKknnMkF/Ntzu18JW5VG7F4NoWAZRveA
	AqY6gNziSbvQ5ozQp91MFAlGPM8L/LTkTbosuC+rrijsR4ZnK3cICruSZyVcWEA6puR/4AN9z58
	66YYTsLs7TT5Vp9dC9xCuBVraBsz/3LRgZp6wEw7IryP/5H2/qdGJjUrHj8FORPvJ5xt0e0eSXl
	5AjCQxbWDfY1Ofp3xRuJHrCSIn7nLj/AtqbHOVETg5hvz9xCptstQ0Z0xIILDUnLF3libp5MaKI
	C0E+V8V5Je2W2omCIuv0X8NUU8Y8tTDIr3ekFoNmDTGiHylWNFtdp15Y5b9Q4ZmRXzLPOmBs6ck
	OFTKdQur/sRlr1Rm2lL4LEdiWlaADLr7QCfUb910JPn7OtlmOOCBdq4zJC0HgC7Q0hcQOoFMK8Z
	2G+zsDjfJchgBAsvE0/Trn11dqeMhOuX+KkjghdFs1Palx1F7FgjrIUOD516zKahdD1fJA5yGGb
	bqhzgGMh4xW4KoFLgh+ATwHubXmYPY3unlF91PYvvYwIPWd0vNw5o6OsgKdCqCBal9wQBMRgfwq
	p+IjWXt7EQ17jyDz+6CjWe28lM2BI2A+cxfDXZpysCpz
X-Received: by 2002:a05:600c:a012:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4ac17b2cdffmr76561575e9.8.1793397576641;
        Fri, 30 Oct 2026 14:59:36 -0700 (PDT)
Received: from linux-virtualbox ([176.123.18.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm163840985e9.4.2026.10.30.14.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:59:36 -0700 (PDT)
From: Salah Ahmed <haddad2inc@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	Peng Fan <peng.fan@nxp.com>,
	Rosen Penev <rosenp@gmail.com>,
	Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: trigger-netdev: add byte-rate threshold mode
Date: Sat, 31 Oct 2026 00:59:24 +0300
Message-ID: <20261030215924.18060-1-haddad2inc@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The tx/rx modes blink once per observed change of the packet counters,
which misses traffic forwarded in hardware (DSA bridge offload) and
flickers on background broadcast noise. Add a rate_threshold attribute
(KiB/s): when non-zero the trigger drives the LED from the interface byte
rate instead, blinking on a 50..150 ms ladder above the threshold and
resting in the baseline state (solid on link, dark without carrier) below
it.

The rate is measured over the interval between two observed counter
changes, not over a fixed window. Drivers that refresh their counters in
bursts - a cached switch MIB polled every few seconds, for instance -
would otherwise dump a whole accumulation period into the first fixed
window that follows the refresh: the reported rate is then several times
the real one, followed by zero until the next refresh, which turns the LED
into a stutter instead of a steady blink. Measuring between changes makes
the trigger independent of the driver's refresh interval, and the last
measured rate is kept until the counter has been silent for twice the
interval it was measured over (capped at 10 s) so that the blink lasts as
long as the traffic does.

The blink is re-armed only when the ladder step changes: led_blink_set()
restarts the software blink timer and truncates the phase in progress, so
re-arming it on every evaluation shows up as an irregular cadence.

Rate mode is independent of the link/tx/rx mode bits on purpose, so that
ports whose packet counters are blind to offloaded flows still show
activity. It yields to hw_control, and writing 0 restores the link state
even for an LED with no tx/rx bit set, because the packet path only touches
the LED when the activity counter changes.

Byte counters can legitimately go backwards when a driver resets them, and
an unsigned subtraction would then report an enormous rate, so a decreasing
counter re-anchors the measurement instead. div_u64() keeps 32-bit
architectures linking without __udivdi3/__aeabi_uldivmod.

Bursty transfers can straddle a ladder boundary on every evaluation,
and cutting the blink off the instant the counter goes quiet makes a
pausing transfer look like the LED died. The measured rate is therefore
smoothed the way field-accepted userspace activity daemons do it -
immediate attack at or above the threshold, a slow rise and a quick
release below it - and when the counter goes silent the blink fades out
quadratically from the last peak over 20 s, with the ladder step only
ever slowing during the fade.

set_baseline_state() runs after every netdev notifier event and after
every mode or device_name write, and both callers cancel the work first.
It sets a solid brightness and cancels the work first, so with a rate
threshold set it also owns the rate-mode bookkeeping: clear the armed
ladder step, stop a software blink that is still armed (while it runs, a
solid brightness set here only lands in blink_brightness), and reschedule
the work. Rescheduling is what keeps rate mode alive on a link-only LED
across carrier changes and honest on tx/rx LEDs under load: without it the
work computes the same ladder step as before, skips the re-arm while the
brightness has just been reset to solid, and a below-threshold sample
after a cleared rate_last_ms leaves an old blink running.

The state a rate-mode blink rests in is the trigger's baseline state, not
a second policy: netdev_baseline_on() answers "is this LED on at rest?"
from the same link, speed and duplex mode bits the baseline uses, and
netdev_set_resting() applies the same level, blink_brightness. Both
set_baseline_state() and the post-blink path call it, so the two cannot
drift apart: a mode without a link bit rests dark, and a multi-level LED
rests at its blinking level rather than at LED_ON (1), which would read
nearly dark. On a single-level LED (max_brightness = 1) the two values
coincide, so nothing differs there.

Signed-off-by: Salah Ahmed <haddad2inc@gmail.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 417 +++++++++++++++++++++-----
 1 file changed, 349 insertions(+), 68 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 5b01324845..941cb13cdf 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -20,6 +20,7 @@
 #include <linux/leds.h>
 #include <linux/linkmode.h>
 #include <linux/list.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/mutex.h>
@@ -31,6 +32,21 @@
 
 #define NETDEV_LED_DEFAULT_INTERVAL	50
 
+/* Rate mode: a measured rate is kept for two counter refresh intervals before
+ * it counts as stale, capped so that a dead link cannot blink for long.
+ * NETDEV_RATE_MAX_ELAPSED_MS keeps the u32 divisor of div_u64() in range.
+ */
+#define NETDEV_RATE_STALE_MULT		2
+#define NETDEV_RATE_STALE_MAX		(10 * HZ)
+#define NETDEV_RATE_MAX_ELAPSED_MS	1000000
+
+/* Afterglow: when the counter goes quiet the blink does not cut off at once;
+ * the last measured peak fades out quadratically over this window, mirroring
+ * the decay shape of the userspace activity daemons this mode replaces in the
+ * field, so a transfer that pauses briefly does not look like the LED died.
+ */
+#define NETDEV_RATE_AFTERGLOW		(20 * HZ)
+
 /*
  * Configurable sysfs attributes:
  *
@@ -42,6 +58,14 @@
  * rx -  LED blinks on receive data
  * tx_err -  LED blinks on transmit error
  * rx_err -  LED blinks on receive error
+ * rate_threshold - KiB/s; when non-zero the trigger blinks according to
+ *         the interface byte rate (ladder 50..150 ms) instead of per-packet,
+ *         resting in the baseline (link) state below the threshold.
+ *         Byte-rate mode sees traffic that packet counters miss once the
+ *         driver reports wire bytes in its stats (e.g. cached switch MIB on
+ *         DSA ports). The rate is measured between two counter updates
+ *         rather than over a fixed window, so counters that are refreshed
+ *         in bursts report their true average rate.
  *
  * Note: If the user selects a mode that is not supported by hw, default
  * behavior is to fall back to software control of the LED. However not every
@@ -68,6 +92,23 @@ struct led_netdev_data {
 	atomic_t interval;
 	unsigned int last_activity;
 
+	/* Rate mode state: rate_bytes/rate_jiffies anchor the last observed
+	 * counter change, rate_interval is the time that produced it,
+	 * rate_kbps the rate measured over that interval, and rate_last_ms the
+	 * blink period currently armed (0 = solid). rate_threshold_kbps is the
+	 * threshold in KiB/s, 0 = rate mode disabled.
+	 */
+	u64 rate_bytes;
+	unsigned long rate_jiffies;
+	unsigned long rate_interval;
+	unsigned long rate_kbps;
+	unsigned long rate_last_ms;
+	unsigned long rate_threshold_kbps;
+	unsigned long rate_smooth;
+	unsigned long rate_peak;
+	unsigned long rate_ag;
+	bool rate_valid;
+
 	unsigned long mode;
 	int link_speed;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_link_modes);
@@ -79,6 +120,80 @@ struct led_netdev_data {
 
 static const struct attribute_group netdev_trig_link_speed_attrs_group;
 
+/*
+ * The resting (non-blinking) state of a netdev LED. The link and duplex
+ * mode bits decide whether it is lit at all, and the level it is lit at is
+ * blink_brightness rather than LED_ON, so that a multi-level LED is not
+ * dimmed to its lowest step and a tx/rx-only LED is not left solid once the
+ * traffic stops. Both the baseline path and the rate-mode path that returns
+ * the LED to rest after a blink use this, so they cannot drift apart.
+ */
+static bool netdev_baseline_on(struct led_netdev_data *trigger_data)
+{
+	if (test_bit(TRIGGER_NETDEV_LINK, &trigger_data->mode))
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_10, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_10)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_100, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_100)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_1000, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_1000)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_2500, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_2500)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_5000, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_5000)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_10000, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_10000)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_25000, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_25000)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_40000, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_40000)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_50000, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_50000)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_100000, &trigger_data->mode) &&
+	    trigger_data->link_speed == SPEED_100000)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) &&
+	    trigger_data->duplex == DUPLEX_HALF)
+		return true;
+
+	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &trigger_data->mode) &&
+	    trigger_data->duplex == DUPLEX_FULL)
+		return true;
+
+	return false;
+}
+
+static void netdev_set_resting(struct led_netdev_data *trigger_data)
+{
+	struct led_classdev *led_cdev = trigger_data->led_cdev;
+
+	if (trigger_data->carrier_link_up && netdev_baseline_on(trigger_data))
+		led_set_brightness(led_cdev, led_cdev->blink_brightness);
+	else
+		led_set_brightness(led_cdev, LED_OFF);
+}
+
 static void set_baseline_state(struct led_netdev_data *trigger_data)
 {
 	int current_brightness;
@@ -91,85 +206,54 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 		return;
 	}
 
+	/* While a rate-mode software blink is still armed, the solid
+	 * brightness below only lands in blink_brightness (LED_BLINK_SW),
+	 * and the work re-arms the blink only on a ladder step change: with
+	 * rate_last_ms cleared, a below-threshold sample computes the same
+	 * zero step and the old blink keeps running. Stop it here; the work
+	 * re-arms it from the measured rate, as rate_threshold_store() does.
+	 */
+	if (trigger_data->rate_threshold_kbps)
+		led_stop_software_blink(led_cdev);
+
 	current_brightness = led_cdev->brightness;
 	if (current_brightness)
 		led_cdev->blink_brightness = current_brightness;
 	if (!led_cdev->blink_brightness)
 		led_cdev->blink_brightness = led_cdev->max_brightness;
 
-	if (!trigger_data->carrier_link_up) {
-		led_set_brightness(led_cdev, LED_OFF);
-	} else {
-		bool blink_on = false;
+	netdev_set_resting(trigger_data);
 
-		if (test_bit(TRIGGER_NETDEV_LINK, &trigger_data->mode))
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_10, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_10)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_100, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_100)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_1000, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_1000)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_2500, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_2500)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_5000, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_5000)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_10000, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_10000)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_25000, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_25000)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_40000, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_40000)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_50000, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_50000)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_LINK_100000, &trigger_data->mode) &&
-		    trigger_data->link_speed == SPEED_100000)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) &&
-		    trigger_data->duplex == DUPLEX_HALF)
-			blink_on = true;
-
-		if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &trigger_data->mode) &&
-		    trigger_data->duplex == DUPLEX_FULL)
-			blink_on = true;
-
-		if (blink_on)
-			led_set_brightness(led_cdev,
-					   led_cdev->blink_brightness);
-		else
-			led_set_brightness(led_cdev, LED_OFF);
-
-		/* If we are looking for RX/TX start periodically
-		 * checking stats
+	/* If we are looking for RX/TX (or a rate threshold is set) start
+	 * periodically checking stats
+	 */
+	if (trigger_data->carrier_link_up &&
+	    (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
+	     test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
+	     test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
+	     test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode) ||
+	     trigger_data->rate_threshold_kbps)) {
+		/* Rate mode re-arms the blink only when the ladder step
+		 * changes, and the brightness has just been set to a solid
+		 * state, so forget the step that was armed before this.
 		 */
-		if (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode))
-			schedule_delayed_work(&trigger_data->work, 0);
+		trigger_data->rate_last_ms = 0;
+		schedule_delayed_work(&trigger_data->work, 0);
 	}
 }
 
+/* Drop the measured rate whenever the counter source changes, so that the
+ * next sample re-anchors instead of subtracting counters of two interfaces.
+ */
+static void netdev_trig_rate_reset(struct led_netdev_data *trigger_data)
+{
+	trigger_data->rate_valid = false;
+	trigger_data->rate_kbps = 0;
+	trigger_data->rate_smooth = 0;
+	trigger_data->rate_peak = 0;
+	trigger_data->rate_ag = 0;
+}
+
 static bool supports_hw_control(struct led_classdev *led_cdev)
 {
 	if (!led_cdev->hw_control_get || !led_cdev->hw_control_set ||
@@ -311,6 +395,7 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 		get_device_state(trigger_data);
 
 	trigger_data->last_activity = 0;
+	netdev_trig_rate_reset(trigger_data);
 
 	/* Skip if we're called from netdev_trig_activate() and hw_control is true */
 	if (!trigger_data->hw_control || led_get_trigger_data(trigger_data->led_cdev))
@@ -509,7 +594,51 @@ static ssize_t interval_store(struct device *dev,
 	return size;
 }
 
+static ssize_t rate_threshold_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
+
+	return sprintf(buf, "%lu\n", trigger_data->rate_threshold_kbps);
+}
+
+static ssize_t rate_threshold_store(struct device *dev,
+				    struct device_attribute *attr, const char *buf,
+				    size_t size)
+{
+	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
+	unsigned long value;
+	int ret;
+
+	if (trigger_data->hw_control)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 0, &value);
+	if (ret)
+		return ret;
+
+	cancel_delayed_work_sync(&trigger_data->work);
+
+	trigger_data->rate_threshold_kbps = value;
+	trigger_data->rate_last_ms = 0;
+	netdev_trig_rate_reset(trigger_data);
+
+	/* Leaving rate mode has to undo the blink it armed: while a software
+	 * blink is running led_set_brightness() only changes the blink
+	 * brightness, and the packet mode below touches the LED only when the
+	 * activity counter changes, so a link-only LED would keep blinking.
+	 */
+	led_stop_software_blink(trigger_data->led_cdev);
+	set_baseline_state(trigger_data);	/* resets timer */
+
+	if (value)
+		schedule_delayed_work(&trigger_data->work, 0);
+
+	return size;
+}
+
 static DEVICE_ATTR_RW(interval);
+static DEVICE_ATTR_RW(rate_threshold);
 
 static ssize_t offloaded_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
@@ -593,6 +722,7 @@ static struct attribute *netdev_trig_attrs[] = {
 	&dev_attr_rx_err.attr,
 	&dev_attr_tx_err.attr,
 	&dev_attr_interval.attr,
+	&dev_attr_rate_threshold.attr,
 	&dev_attr_offloaded.attr,
 	NULL
 };
@@ -639,12 +769,14 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		dev_put(trigger_data->net_dev);
 		dev_hold(dev);
 		trigger_data->net_dev = dev;
+		netdev_trig_rate_reset(trigger_data);
 		if (evt == NETDEV_CHANGENAME)
 			get_device_state(trigger_data);
 		break;
 	case NETDEV_UNREGISTER:
 		dev_put(trigger_data->net_dev);
 		trigger_data->net_dev = NULL;
+		netdev_trig_rate_reset(trigger_data);
 		break;
 	case NETDEV_UP:
 		trigger_data->hw_control = can_hw_control(trigger_data);
@@ -674,6 +806,8 @@ static void netdev_trig_work(struct work_struct *work)
 	unsigned int new_activity;
 	struct rtnl_link_stats64 temp;
 	unsigned long interval;
+	unsigned long now, ms, elapsed, stale;
+	u64 bytes;
 	int invert;
 
 	/* If we dont have a device, insure we are off */
@@ -682,6 +816,153 @@ static void netdev_trig_work(struct work_struct *work)
 		return;
 	}
 
+	/* Rate mode: blink on a ladder driven by the interface byte rate instead
+	 * of per packet. Independent of the packet-mode bits so that interfaces
+	 * whose packet counters are blind to hardware-forwarded traffic still
+	 * show activity, and so that a sub-threshold link rests in its baseline
+	 * state (solid with a link bit, dark without one).
+	 *
+	 * The rate is measured over the interval between two observed counter
+	 * changes, not over a fixed window. Counters that are refreshed in
+	 * bursts - a cached switch MIB polled every few seconds, for instance -
+	 * dump their whole accumulation into the first fixed window that follows
+	 * the refresh, which reports a rate several times too high and then
+	 * zero until the next refresh. Measuring between changes makes the
+	 * trigger independent of how often the driver refreshes its counters,
+	 * and keeps the blink running for as long as the traffic does.
+	 */
+	if (trigger_data->rate_threshold_kbps && !trigger_data->hw_control) {
+		dev_stats = dev_get_stats(trigger_data->net_dev, &temp);
+		bytes = dev_stats->rx_bytes + dev_stats->tx_bytes;
+		now = jiffies;
+
+		if (!trigger_data->rate_valid) {
+			trigger_data->rate_bytes = bytes;
+			trigger_data->rate_jiffies = now;
+			trigger_data->rate_interval = HZ;
+			trigger_data->rate_valid = true;
+		} else if (bytes != trigger_data->rate_bytes) {
+			if (bytes > trigger_data->rate_bytes) {
+				trigger_data->rate_interval =
+					now - trigger_data->rate_jiffies;
+				elapsed = jiffies_to_msecs(trigger_data->rate_interval);
+				if (elapsed > NETDEV_RATE_MAX_ELAPSED_MS)
+					elapsed = NETDEV_RATE_MAX_ELAPSED_MS;
+				trigger_data->rate_kbps =
+					div_u64((bytes - trigger_data->rate_bytes) * 1000,
+						elapsed * 1024);
+			} else {
+				/* Counters went backwards (reset or wrapped):
+				 * re-anchor instead of reporting a huge rate.
+				 */
+				trigger_data->rate_kbps = 0;
+			}
+			trigger_data->rate_bytes = bytes;
+			trigger_data->rate_jiffies = now;
+		} else {
+			/* No change: keep the last measured rate for as long as
+			 * the counter keeps being refreshed, then fall back to
+			 * the link state.
+			 */
+			stale = trigger_data->rate_interval * NETDEV_RATE_STALE_MULT;
+			if (stale > NETDEV_RATE_STALE_MAX)
+				stale = NETDEV_RATE_STALE_MAX;
+			if (time_after(now, trigger_data->rate_jiffies + stale))
+				trigger_data->rate_kbps = 0;
+		}
+
+		/* Smoothing ported from the userspace daemon this replaces: attack
+		 * immediately at or above the threshold so the first evaluation of
+		 * a transfer already blinks, rise slowly and release quickly below
+		 * it so the ladder step does not chatter when a bursty rate
+		 * straddles a boundary.
+		 */
+		if (trigger_data->rate_kbps >= trigger_data->rate_threshold_kbps)
+			trigger_data->rate_smooth = trigger_data->rate_kbps;
+		else if (trigger_data->rate_kbps < trigger_data->rate_smooth)
+			trigger_data->rate_smooth = (trigger_data->rate_smooth +
+				3 * trigger_data->rate_kbps) / 4;
+		else
+			trigger_data->rate_smooth = (3 * trigger_data->rate_smooth +
+				trigger_data->rate_kbps) / 4;
+
+		if (trigger_data->rate_smooth >= trigger_data->rate_threshold_kbps) {
+			if (trigger_data->rate_smooth > trigger_data->rate_peak)
+				trigger_data->rate_peak = trigger_data->rate_smooth;
+			trigger_data->rate_ag = 0;
+		}
+
+		ms = 0;
+		if (trigger_data->carrier_link_up) {
+			unsigned long rate = trigger_data->rate_smooth;
+
+			/* Quadratic afterglow from the last peak: the synthetic rate
+			 * decays as peak * remaining^2 / window^2 over
+			 * NETDEV_RATE_AFTERGLOW, then the LED returns to the link
+			 * state. div_u64() keeps 32-bit builds linking.
+			 */
+			if (rate < trigger_data->rate_threshold_kbps &&
+			    trigger_data->rate_peak >= trigger_data->rate_threshold_kbps &&
+			    trigger_data->rate_ag < NETDEV_RATE_AFTERGLOW) {
+				unsigned long rem;
+
+				trigger_data->rate_ag += HZ / 2;
+				rem = NETDEV_RATE_AFTERGLOW - trigger_data->rate_ag;
+				rate = div_u64((u64)trigger_data->rate_peak * rem * rem,
+					       NETDEV_RATE_AFTERGLOW *
+							NETDEV_RATE_AFTERGLOW);
+			}
+
+			if (rate >= trigger_data->rate_threshold_kbps) {
+				if (rate >= 4096)
+					ms = 50;
+				else if (rate >= 1024)
+					ms = 60;
+				else if (rate >= 256)
+					ms = 80;
+				else if (rate >= 32)
+					ms = 100;
+				else
+					ms = 150;
+			}
+
+			/* During the fade the step only ever gets longer: re-arming
+			 * a faster blink mid-decay looks like stutter.
+			 */
+			if (ms && trigger_data->rate_ag &&
+			    ms < trigger_data->rate_last_ms)
+				ms = trigger_data->rate_last_ms;
+		}
+
+		if (!ms) {
+			trigger_data->rate_peak = 0;
+			trigger_data->rate_ag = 0;
+		}
+
+		/* Re-arm only when the blink period actually changes: every
+		 * led_blink_set() restarts the software blink and truncates the
+		 * phase in progress, which shows up as an irregular cadence.
+		 */
+		if (ms != trigger_data->rate_last_ms) {
+			led_stop_software_blink(trigger_data->led_cdev);
+			if (ms) {
+				unsigned long delay_on = ms, delay_off = ms;
+
+				led_blink_set(trigger_data->led_cdev, &delay_on,
+					      &delay_off);
+			} else {
+				/* Resting state == the baseline state: same mode bits,
+				 * same brightness level (see netdev_set_resting()).
+				 */
+				netdev_set_resting(trigger_data);
+			}
+			trigger_data->rate_last_ms = ms;
+		}
+
+		schedule_delayed_work(&trigger_data->work, HZ / 2);
+		return;
+	}
+
 	/* If we are not looking for RX/TX then return  */
 	if (!test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) &&
 	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) &&
-- 
2.53.0

