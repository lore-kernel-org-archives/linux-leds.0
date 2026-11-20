Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209936;
	b=fN3QVlzdrq1kxN8gRFn1nrUjGT8LSlxgdh3/6PcYSUQncND85fqNHYIlOaw3Eb+nCRTM
	 jj9nmyyEf8QD+CmXF7W/FvAgtkpSDDJxyZ0IqzA9YmuFPa7DFvG7EKR5lYyRh1eXNQRLH
	 L9X6ll0oilKSqcUYrMjQrUpWF6DuijCVZujMaeG9uQaNHJKqJRD/wwzcxx4xxVvhgEJVg
	 h6DcNvZ3o9O+E/ZSN5hywruQrB7NMS+EAr+lQ0VKW+ogpiBOSDeUfBQXRzHcF8admggV/
	 BvZuhZER43FWSEX1Li4sDD5plONeEF11kqP+l3G1QHNFw9ethWuu0XTOKmcE+hAz8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209936;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=jWKBSzdAzzsDzCt82X+8X/qIHu6aYSXAuHqMqEPQGho=;
	b=XaPzNQxa4oA7vRXYK6VdXXky7ZKnKH5M2j6MhcUVDW6xYMkby//QqsotH1WDkaNgCLmF
	 A4rjauNgKl6PWTrs9Oitrn4G+wuZUS252HUE9bkyR+7zIOq1jV9UKsu8QHkgo8MwG6UY5
	 zGH9J2y1cSCkw8LXKtWhB6mm44aFscKXFXKXpokSxpPiPMD0ylKQNNeXBaIbyk1jg634i
	 2I2eb9CZoRj1Q8blTqdhlmVOcsiyNLS9vUwfaI2ov9MyqFgTqiZMeyfsas6BXYzLOXumO
	 vDzvRKiIaROQ2qCyMwIxwIAoBMqP6WFjf7bOPnRWRdtJcxrxqWuZU3yWW/afGry/qmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=HX+yBOqx;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98850606A6B7
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98850606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=HX+yBOqx
DKIM2-Signature:  i=1; m=1; t=1795209931;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:Uyhi6zLyJFgcSoKPnc512vDmRyu0
   pDIc/VvNELyb1hpjpFolf7dSb4xRS3vEQ5ngzSlNn/KTB6cCTad0YGDsCoYj85LLsrzfsE4TTrT
   bjKviYHfiB/rrQNGHLCemFnribsqk76Vyy4OZESGJCSK9afH69nh4yPyeaiexOI0HPo/m9r4PoN
   9kKIjDMZyO8p4r3eeFKfQGaSz0Vo9IV2rSmwSdjJNpDEUD1WnPF3r7I1zT64PL72LWYm62ggM8m
   cl62G3u+4Obe2TezBhdOqvRfAtl1vcuPSVNU0PmP/XRXKkLPOytiIOBddjU1IGx5qgnXNiNnP2T
   XGZ6u//sreV0gQ==;
Message-Instance:  m=1;
 h=sha256:
   G7jN/YsF7zA/e0eo8k1w/wSENyqNp8rcBnyz71iljRo=:
   h3fdsL54NEfP0jAYDQXAp2+cphLmYjEzMCj4tm5gBds=,
  sha512:
   MDSPwMbVKyruJGbvw9w7jxbJAV6TzVYND7na5d825oaFIl7QA4QR7TGYVIpZFv0B6cC2G5UYAFqA12CdkubhUA==:
   mPwPxeK4hKStXrxy7Rc4YOgr2/IKc6101hAlTu2KH5/s4wy0LgSfjZX8BfD/NzNYqZ54yqR41mGy5CRZW27bHg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209886; x=1795814686; i=w_armin@gmx.de;
	bh=jWKBSzdAzzsDzCt82X+8X/qIHu6aYSXAuHqMqEPQGho=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HX+yBOqxLudojF9iMyJU7+0Az9yaE+TxiGYwUyg357MRTjZAqwwri9TGrl1tayLf
	 Vl0QTJEUPOT5uFYEYdsFqLj6Olb8xBSqxlcOPgLbSDp+HWMO9MTHJWdSIlvv5gIr7
	 5EaF7q8R1CyD6Y6X+60PZzRiosyr36R1Hl7nWp5PrrVlmeUPOAQ3ub/5NNZR5YCX/
	 mSzLdq4NlWORiS14EU/XM3v7Yy63ybPp/jnkMjAbX8vj+c7LRsD8yIcAxH5wzTwV3
	 LmCqVXe1hV9A1irWVBfbPUfr16O0OKz6ICDVgmFaLym26bX68jNtiSJlZRtMAlMYi
	 5gMdBQZgaUNFD58mNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1yOXWj1dTo-014QEm; Fri, 20
 Nov 2026 22:24:45 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 05/11] leds: class: Fix race condition when creating the device
Date: Fri, 20 Nov 2026 22:22:22 +0100
Message-ID: <20261120212431.152081-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120212431.152081-1-W_Armin@gmx.de>
References: <20261120212431.152081-1-W_Armin@gmx.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IX7HB0rZpwpaVJ04PyghGaDlIvTehy3V/agOIWBfsx9ipMs/h5Y
 ayfcbWL81s9S1drK6vjFydd7DB1CfiPnuqgg5KS75zG/8g0cYUDlulIZHbj9g5FDHIegl5E
 jlXxnwUynWKzOADjg3HOaA82AEwkp+fGamrw6INJMzT4nLzNvxAwWFJZcVRZccfCZshPVra
 UK8c70qOcWUvbhBDJ9TMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kE27ah4ggn8=;L4TE2EEdGkJkTCedL97lIrK8ynX
 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
 uwWIFHFzTad5KZHLnw==

Userspace applications can access the sysfs attributes as soon as
device_create_with_groups() has returned. Two of those sysfs
attributes ("brightness_hw_changed" and "max_brightness") access
fields that are not properly initialized at this point, with only
"max_brightness" guarding against this by taking the LED access lock.

Fix the race condition affecting "brightness_hw_changed" by creating
the device after the associated fields have been properly initialized.
This also allows us to drop the LED access lock inside
max_brightness_show(), as the maximum brightness does not change after
initialization.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 00532437cc45..fa9803e2ae6d 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -81,13 +81,8 @@ static ssize_t max_brightness_show(struct device *dev, =
const struct device_attri
 				   char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
-	unsigned int max_brightness;
=20
-	mutex_lock(&led_cdev->led_access);
-	max_brightness =3D led_cdev->max_brightness;
-	mutex_unlock(&led_cdev->led_access);
-
-	return sysfs_emit(buf, "%u\n", max_brightness);
+	return sysfs_emit(buf, "%u\n", led_cdev->max_brightness);
 }
=20
 static const DEVICE_ATTR_RO(max_brightness);
@@ -555,6 +550,18 @@ int led_classdev_register_ext(struct device *parent,
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
 	mutex_init(&led_cdev->led_access);
+	led_cdev->work_flags =3D 0;
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	led_cdev->brightness_hw_changed =3D -1;
+#endif
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
+		INIT_WORK(&led_cdev->trigger_hw_changed_work,
+			  led_trigger_hw_control_changed_worker);
+#endif
+	if (!led_cdev->max_brightness)
+		led_cdev->max_brightness =3D LED_FULL;
+
 	mutex_lock(&led_cdev->led_access);
 	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
 						  led_cdev, led_cdev->groups, "%s", final_name);
@@ -562,6 +569,7 @@ int led_classdev_register_ext(struct device *parent,
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
 	}
+
 	if (init_data && init_data->fwnode)
 		device_set_node(led_cdev->dev, init_data->fwnode);
=20
@@ -576,18 +584,6 @@ int led_classdev_register_ext(struct device *parent,
 		}
 	}
=20
-	led_cdev->work_flags =3D 0;
-#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-	led_cdev->brightness_hw_changed =3D -1;
-#endif
-#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
-	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
-		INIT_WORK(&led_cdev->trigger_hw_changed_work,
-			  led_trigger_hw_control_changed_worker);
-#endif
-	if (!led_cdev->max_brightness)
-		led_cdev->max_brightness =3D LED_FULL;
-
 	led_update_brightness(led_cdev);
=20
 	led_cdev->wq =3D leds_wq;
=2D-=20
2.56.1

