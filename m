Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FED4BD352;
	Mon, 12 Oct 2026 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827214; cv=none; b=tAylykmAadmEvVp5AJjWH2t4QJUDmH4TEm2aiVzQ/ZEWjKKyEakuwnJRY1r+G0SKmEI0R67j5XA2KW2HJqYufOrq0sCEZOgZQ9AOGi0EDWieIjN2+TpRAnJapEr0XlRTi6EZ3zvCyRg+daRH2969MeaNv7e6LxkFnGCGG1mKsVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827214; c=relaxed/simple;
	bh=FSKl+tC2xV1nip/FsJ/R2v1Ev0C36qf/tlzUL9ovBC8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=p/YyGDRuGyh0Yr0J/8c0t27eP5iwMpIHLJGiVIf4o9iqStQaY95seM5X3ddGTns0kuGTz+YcSPN9tDkfZh4KXE1j/wz+vU8QssRmVF38VDR9REkuNPI25/Axnln2AC6sQH8l0BKl8xcgNzfJ+1UTIddI1EbyfKWpPovZHpbJPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5hbN9PQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5hbN9PQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39241F008A1;
	Mon, 12 Oct 2026 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827213;
	bh=BOo4tMyDdgZeY3Yeeazza39JFRX3WIXRNLB2dK20Wh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5hbN9PQPUbcxIWt3ixZHf99ZYa/rUJBcXFWy2EytkaZTx6fSsfLw8sBcC7mtQ455
	 i7kP7FtETUnCGbLbxmhttbjNCqANeu/VSDZXjFPZKreDubPjTu6uL0pBdbU8cBXUBx
	 IpNFrt0jBWfQBlR54U7IYTrp07g1oLXByBSgbvYoBGeWVx0cD4C++nCKINJOw/3Tvn
	 PMKDQ2riL0pYjw+etu4cgKCqDMcphFEHKEINVk8mid32SZPhNersjeVWC57LYHa78c
	 hC9dhVhigzfFUaTSThHXQj7r/gwAENOBLUEblV0CeqXuLKrktx8pks3x45HDuT0ihX
	 7p17q2I3kBZAQ==
Message-ID: <sashiko-outbox-168489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] leds: Add NVIDIA LSTP LED driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: lee@kernel.org, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-7-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-7-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:46:52 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] leds: applying initial brightness before parsing DT max-brightness
- [Medium] leds: rejecting DT nodes with only color and allowing deprecated=
 label
- [Low] leds: non-standard commit message prefix missing driver name
--

commit 231bdc9e871148317f849221691f708a54dbd399
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

leds: Add NVIDIA LSTP LED driver
   =20
This commit introduces a new driver for LEDs on NVIDIA LSTP USB adapters.
It uses the GPIO channel of the adapter, hands blink and pattern requests
directly to the hardware, and configures them via device tree child nodes.

> leds: Add NVIDIA LSTP LED driver

[Severity: Low]
This isn't a bug, but the commit message prefix seems to be missing the
driver name. Should this follow the standard format, such as
"leds: lstp: Add NVIDIA LSTP LED driver" to help with git history
categorization?

diff --git a/drivers/leds/leds-lstp.c b/drivers/leds/leds-lstp.c
new file mode 100644
index 0000000000000..352e484eb9194
--- /dev/null
+++ b/drivers/leds/leds-lstp.c
[ ... ]
@@ -275,20 +275,21 @@ static int lstp_led_register(struct device *dev, stru=
ct lstp_led *led, struct fw
+		if (!ret) {
+			bool pattern =3D fwnode_property_present(fwnode, "led-pattern");
+			bool trigger =3D fwnode_property_present(fwnode, "linux,default-trigger=
");
+
+			/* A trigger takes precedence; the LED core applies it from @fwnode. */
+			if (pattern && trigger)
+				dev_err(dev,
+					"%s: ch_%d: Ignoring led-pattern of LED '%s': %pfw also sets linux,de=
fault-trigger\n",
+					__func__, led->ch->ch_id, led->cdev.name, fwnode);
+			if (pattern && !trigger)
+				lstp_led_send_fwnode_pattern(led, fwnode);
+			else
+				lstp_led_apply_default_state(led, fwnode);

[Severity: High]
Does applying the initial hardware state here happen too early? At this
point, led_classdev_register_ext() has not yet been called, so the device
tree max-brightness property hasn't been parsed into led->cdev.max_brightne=
ss.

As a result, lstp_led_apply_default_state() will use the uninitialized
max_brightness value of 255 (U8_MAX) to drive the hardware. Could this risk
over-driving the hardware before the registration layer correctly enforces
the bound?

+			ret =3D lstp_led_classdev_register(dev, &led->cdev, &init_data);
+		}
+	}
+
+	if (ret)
+		dev_warn(dev, "%s: ch_%d: Could not register LED '%s', pin %u (%pe)\n", =
__func__,
+			 led->ch->ch_id, led->cdev.name, led->pin, ERR_PTR(ret));
+	return ret;
+}
[ ... ]
@@ -328,34 +328,41 @@ static int lstp_leds_probe(struct auxiliary_device *a=
uxdev, const struct auxilia
[ ... ]
+		if (led->cdev.dev) {
+			dev_warn(dev, "%s: ch_%d: Ignoring %pfw: pin %u is already described\n",
+				 __func__, ch->ch_id, child, pin);
+			continue;
+		}
+		if (!fwnode_property_present(child, "label") &&
+		    !fwnode_property_present(child, "function")) {

[Severity: Medium]
Does this logic incorrectly reject modern device tree nodes? The LED
subsystem guidelines dictate that the label property is deprecated and
should be avoided, while color and function are preferred.

By warning and skipping nodes that lack both label and function, valid
modern DT nodes that rely solely on the color property (e.g.,
color =3D <LED_COLOR_ID_GREEN>) would be entirely rejected. Should this che=
ck
be updated to account for the color property and align with modern naming
requirements?

+			dev_warn(dev, "%s: ch_%d: Ignoring %pfw: neither label nor function\n",
+				 __func__, ch->ch_id, child);
+			continue;
+		}
+		lstp_led_register(dev, led, child);
+	}
+	fwnode_handle_put(node);
+
+	for (u16 i =3D 0; i < pins->npins; i++) {
+		if (!leds[i].cdev.dev)
+			lstp_led_register(dev, &leds[i], NULL);
+	}
+
+	return 0;
+}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D7
