Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D329408
	for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2026 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776817; cv=none; b=e5BdYkARPRh/9RDRUMZ0K2HjHMGffvbS20v/xN446PQlOLXyLnRIt+BKEySajwt7tOGmMU6vq8ZeDw/8oWk5o8icXXnnVjmlhxe8SKOorr+sfYeIjRzJMx4R0TaDFx3o+42Av+ZuO9B3TNwO5/dDLZcx8imLlhWiDwPrPDkUU70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776817; c=relaxed/simple;
	bh=yxdU8yxNR0ibBUviMecbMTWgSTRnUEjAQ13FWmuxr8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqD84Ke8KK5kCP6N4EhwV8hyduSEHcX5yIBX5AYsHUZQXc0sTJzb/5Jk8hP+okoTHrypYNKAWPMGgRWO05ozYQmlQG4zWWRqyddTocvUKvUmjuWwQhf7WOjVeldcNVmyFp8A9sbzVHYE8I8Tz3h1Gwa+SpJ9N1etBP1MjCG89aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=funxL8Eh; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="funxL8Eh"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c5so1130941b3a.3
        for <linux-leds@vger.kernel.org>; Fri, 18 Sep 2026 17:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789776815; x=1790381615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jclCYy7RtirFkygzbMPjnT2XKmcP25jJ49O0tev6J4Y=;
        b=funxL8EhRylkpEJtz7RiDGfwPcGwKqk3qkvQ5PPKs9wfHpMiK0JqXKaforWUzNhDjt
         02eJWQLvoOIBEdZcw66IXr3eBCE2vs+m8VGJhXHU+WQJJwUttZaRSB8NqH+8OKI/rFVm
         0Ltn1OSXHJI+sOycmfQ3mxRkyT0pfhdygCwBo2uNkqw0LmKTJrtmgwepBPqIPz6NnMsB
         /K07C+IpRzf41sENtvLODfcVoPqf0C9NoyV4ONAmgJoCkAK5SMbRn9VjwmylT/SrFxQx
         mS/44wcwKHwCkrPPcE8jJ2kV89Jq23q3AvaCtZ4cw0CvuQ16+++dt8/wXTTLVtnqgTkz
         o8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789776815; x=1790381615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jclCYy7RtirFkygzbMPjnT2XKmcP25jJ49O0tev6J4Y=;
        b=LWUyUWbQI93p7pxWqxjBJrG+j53Uqt9DvbwV0Jf01EMPRPpMDOjizW2GPGN7waNDyK
         VwDmrq8SE9J999sc5xF/PHbZbyQ0V6wGVjPjvNIEgRrK6f4BT7r1c97uVtYY3zlAr+J7
         6ey5mYp1ZXaNMsA6zmaeVr4gPArOJOeMVoO3jqy3wQzJF2zjkE2wPjILJsj3MYnBTUVo
         iMPObdO+SNdywk3E9dPzLf82RdhCa4rC0zB41Wt/y9Af4PDpkEiwRDrwsmqX4Nun/grQ
         HYNSlmh2Q/ibrJZmynLqY/gJ67z7a2YGFLXGdnU4FpfJEQ8cabmHe39CWiQ0KVKToIjv
         OPhQ==
X-Gm-Message-State: AFuF++m1yIKdpX0kWBvgRXm/Px7rvPZwyrOWvBzEETtqYaTwPRIbnLOm
	ifBtmxC90u1NelOLiJMNtjHeYFyJOe5gUcmjT93Mgvq9zGnMkZcpEnafW8ECzw==
X-Gm-Gg: AYBFou1pHZ/O4Kxc+8SQYTq8EBcqCu8YIj3vzDfmAy3qnjJaX0z8bEQ7mVyI/FsDsap
	ku3lerQptPSOD+CRSv98glXkOjIb6LoT2G8f7Dug0jJj6zLL30vUhOlKTh4lSws92EUc5YQnmxR
	gCvxhPyhshRxkHE6F96406ARKraZ33KK7aiUQSmefknB/gOpfBuYBXVXUTHpLLR3pBa1EXhDcy5
	QP+YLb5CgKEIzSVQ52K+NjuMwoz3zNluUteNuZI7bPwL1WPcdDv0SfqpCrhlPhPY2mtewbyFzmf
	fJEzSTKwVRFHfvM6IkXOy3qrRrjaQjNhBc3l49THIpGFcKHfeyY2Qc3EIjzkFSfh74/bId3HNY0
	l75iJX8gVizada12O+lPh9MZNeVS9rfRRVkRA8vh4FXJA03luiyM++QH2oR0XFlBCrTkvZoap2J
	HWUUqPDPiEP/C/DZ9WXqYkPzd83liPIA/Ze2kx2NkWvG6yosGR/h9ZgLf/QkHEYOEHJGEBMA8Pk
	T0RaNBEXrNpEvndB2tYfVlcO4MkBzvSlyWbnlAcYGM+/ZpdH8yjXRkCmtn0whmKF/ecMgBNXHOb
	zhlqahESRYZejnqoDQnExKHgMX+XNObC/Lpp+tET/wCsDOxs
X-Received: by 2002:a05:6a00:1a8b:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-874dd6fef50mr7423397b3a.16.1789776815018;
        Fri, 18 Sep 2026 17:13:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f4fefsm382611b3a.25.2026.09.18.17.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:13:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] leds: rgb: qcom-lpg: Use fwnode APIs for LED parsing
Date: Fri, 18 Sep 2026 17:13:31 -0700
Message-ID: <20260919001331.720072-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LED and channel parsing in lpg_add_led() and
lpg_parse_channel() from DT-specific helpers to the fwnode API.
The probe loop now uses device_for_each_child_node_scoped(),
dropping explicit node lifetime handling.

Behaviour is unchanged for device tree: fwnode_get_child_node_count()
and both child iteration helpers skip unavailable children on OF,
and the fwnode handle is passed straight to LED registration.

cdev->default_trigger is only assigned when
fwnode_property_read_string() succeeds, so an absent
linux,default-trigger property no longer yields an uninitialized
pointer.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: assign i to led->mcdev.num_colors
 drivers/leds/rgb/leds-qcom-lpg.c | 38 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..24ffe079f221 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -11,6 +11,7 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -1342,7 +1343,7 @@ static int lpg_add_pwm(struct lpg *lpg)
 	return ret;
 }
 
-static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
+static int lpg_parse_channel(struct lpg *lpg, struct fwnode_handle *fw,
 			     struct lpg_channel **channel)
 {
 	struct lpg_channel *chan;
@@ -1350,17 +1351,18 @@ static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
 	u32 reg;
 	int ret;
 
-	ret = of_property_read_u32(np, "reg", &reg);
+	ret = fwnode_property_read_u32(fw, "reg", &reg);
 	if (ret || !reg || reg > lpg->num_channels)
-		return dev_err_probe(lpg->dev, -EINVAL, "invalid \"reg\" of %pOFn\n", np);
+		return dev_err_probe(lpg->dev, -EINVAL,
+				     "invalid \"reg\" of %s\n", fwnode_get_name(fw));
 
 	chan = &lpg->channels[reg - 1];
 	chan->in_use = true;
 
-	ret = of_property_read_u32(np, "color", &color);
+	ret = fwnode_property_read_u32(fw, "color", &color);
 	if (ret < 0 && ret != -EINVAL)
 		return dev_err_probe(lpg->dev, ret,
-				     "failed to parse \"color\" of %pOF\n", np);
+				     "failed to parse \"color\" of %s\n", fwnode_get_name(fw));
 
 	chan->color = color;
 
@@ -1369,25 +1371,26 @@ static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
 	return 0;
 }
 
-static int lpg_add_led(struct lpg *lpg, struct device_node *np)
+static int lpg_add_led(struct lpg *lpg, struct fwnode_handle *fw)
 {
 	struct led_init_data init_data = {};
 	struct led_classdev *cdev;
 	struct mc_subled *info;
 	struct lpg_led *led;
+	const char *trigger;
 	const char *state;
 	int num_channels;
 	u32 color = 0;
 	int ret;
 	int i;
 
-	ret = of_property_read_u32(np, "color", &color);
+	ret = fwnode_property_read_u32(fw, "color", &color);
 	if (ret < 0 && ret != -EINVAL)
 		return dev_err_probe(lpg->dev, ret,
-			      "failed to parse \"color\" of %pOF\n", np);
+			      "failed to parse \"color\" of %s\n", fwnode_get_name(fw));
 
 	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
-		num_channels = of_get_available_child_count(np);
+		num_channels = fwnode_get_child_node_count(fw);
 	else
 		num_channels = 1;
 
@@ -1403,7 +1406,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		if (!info)
 			return -ENOMEM;
 		i = 0;
-		for_each_available_child_of_node_scoped(np, child) {
+		fwnode_for_each_available_child_node_scoped(fw, child) {
 			ret = lpg_parse_channel(lpg, child, &led->channels[i]);
 			if (ret < 0)
 				return ret;
@@ -1414,7 +1417,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		}
 
 		led->mcdev.subled_info = info;
-		led->mcdev.num_colors = num_channels;
+		led->mcdev.num_colors = i;
 
 		cdev = &led->mcdev.led_cdev;
 		cdev->brightness_set_blocking = lpg_brightness_mc_set;
@@ -1426,7 +1429,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 			cdev->pattern_clear = lpg_pattern_mc_clear;
 		}
 	} else {
-		ret = lpg_parse_channel(lpg, np, &led->channels[0]);
+		ret = lpg_parse_channel(lpg, fw, &led->channels[0]);
 		if (ret < 0)
 			return ret;
 
@@ -1441,14 +1444,15 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		}
 	}
 
-	cdev->default_trigger = of_get_property(np, "linux,default-trigger", NULL);
+	if (!fwnode_property_read_string(fw, "linux,default-trigger", &trigger))
+		cdev->default_trigger = trigger;
 
 	if (lpg->lpg_chan_sdam)
 		cdev->max_brightness = PPG_MAX_LED_BRIGHTNESS;
 	else
 		cdev->max_brightness = LPG_RESOLUTION_9BIT - 1;
 
-	if (!of_property_read_string(np, "default-state", &state) &&
+	if (!fwnode_property_read_string(fw, "default-state", &state) &&
 	    !strcmp(state, "on"))
 		cdev->brightness = cdev->max_brightness;
 	else
@@ -1456,7 +1460,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 
 	cdev->brightness_set_blocking(cdev, cdev->brightness);
 
-	init_data.fwnode = of_fwnode_handle(np);
+	init_data.fwnode = fw;
 
 	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 		ret = devm_led_classdev_multicolor_register_ext(lpg->dev, &led->mcdev, &init_data);
@@ -1638,8 +1642,8 @@ static int lpg_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	for_each_available_child_of_node_scoped(pdev->dev.of_node, np) {
-		ret = lpg_add_led(lpg, np);
+	device_for_each_child_node_scoped(&pdev->dev, child) {
+		ret = lpg_add_led(lpg, child);
 		if (ret)
 			return ret;
 	}
-- 
2.55.0

