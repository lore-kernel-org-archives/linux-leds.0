Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207395;
	b=X9eyAX4/k0I+suqZEZDToSfoW1nvS+qevbdck93gH27dn0N8C+TaIRCuSfO/ViaqsKeI
	 OQWdHC8FoxzMLEgYKKI+6suOQQZKUBChL+ZVsgzn2jCJvp8HN5NtHMpi/jsXWw1PLqA21
	 VnbINz3QS9t6lkw4yv+R9L2NpMvuL5DODpSorY6mE+fOd5rf60EDk+4J0hn/MMR4nPsAt
	 jNVDKsvVP7ixl/qSoRkZ/ZMfxl2ZEn2dvSAiJFhQ+3jRyweNtUYA2k4ysCD61qkjtlCAt
	 ogXRVoFlf55Ix752tN/w8TfvlEVC3+1ghj/Tp9FM5BDKXInUoxujZjqyyFBbg3Zl6YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207395;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=WwXa8+CibsDkkaEdT1jEC/4regEB6eaL8cAgQiNj2VA=;
	b=ZPMTaXTFjjWMI6AxD+DlPChVZe+NoJwJeKBK4XtEWRbgOHR/vvSjP+lHdZeIm0ZMj07o
	 b29olFG8StjTfNp4PBGFmEChThR+eVlWjAB5mD1AgnkduRCYD+llDa+VDVEpwC3ntVnFd
	 gPn0KG7R959GklmXDTgmT+bUZqTQn9PIYcIC8KO2i49WvnviEzDaIqCtY/CifCevB5Jkt
	 Q8ubg87sqdycRNLkPK9dYWH4SJLIekbrl3Ugj98Igb03/BuIueBbhVMw+TjVhX9hwsoPU
	 2PZkXyKjQGMmRi53QYTLdMso/cBHncQjb1VWFzTzbz3n0/bnxmXgsXi/CRtbxyoInQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ADrwj6RG;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C0360780FA
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C0360780FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ADrwj6RG
DKIM2-Signature:  i=1; m=1; t=1795207392;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:LkGnAQQyHr7dGKNkM3FHoEmW4IvO
   ht8/VCFsUfjjoiM/OCMqU3rzu3WDVo0MOkMZThElgrAwO0PoT2WxMQNHsjo1nuAteWEQznItkL+
   l/wODCBJf2DLjNRC1wAfJjlFNJSUEmmW95zSkOBRw6Eh2OUVVtqJuJCv1/il+W4kOsFb8Ts4kfM
   SymLl7gt94YaMuQxezG8MSqoxB39Ukut7AGp2+xfEi2YnLpjTudRkdM2AbCByHMJY/aiZm5FjCw
   gcemykpfDMtHrnD64sBaqjsy3YDIE5A/V6XvCdrTT7HqV1WcfvpZnDIXQL6uBYVIgivBN4A4gqb
   Ly65o/vfaa4YFw==;
Message-Instance:  m=1;
 h=sha256:
   FneJhVZT4n4MyiDWtgTvwBKKZ3/sz/cIVdqeU1QZjg8=:
   V5hOpu2RXGKhOvfLyq/2Y1WiqN0Z9kXHo25MrUErrTM=,
  sha512:
   WcLHoJ/nAN2UQXCpybwabKiKCsobYHmEELJ5IiBhF9XZkd/pQ/x31ZjpflCeVG7JckiY8B7CZc8ptvWglZEjkg==:
   FuP23+zOhzhZV1Y0C7we+W3KG+NLK4ApphT7LChlHoaCkH50TFNLJRNhLzNPd8JNTGmCXlyxZHUm0fnhqwPl2A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207387; x=1795812187; i=w_armin@gmx.de;
	bh=WwXa8+CibsDkkaEdT1jEC/4regEB6eaL8cAgQiNj2VA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ADrwj6RG90NgPB3ENWl/mvf4d+etXuMw+dz57B0Z6CV7hKwKlFhW0ICwF2QIqc1/
	 WmNkRoEYqXeJcPeylh2Cy4xZF1Xua+DTtu9C7AokHKXO2Nq15ohVE0+Ih19Csn7qn
	 Nrz0BQnsfsVD0CksTAC/F+bdSS7vS4Fq9z3ZxsHCDSJjkuSt58rToxiiJVlCaVTPC
	 N8noIHYa0oHb24ZDkqa/mmAyjtivEa7abk+NSfBZZqPDU1U1vMZD5ZUTU2RyNrgOf
	 JPa9UiTn6Ql3zk7/UZiLowhl4GuZXUyStFNzIciX/RLpzIP+QiMMhJZVa7fQVLjyp
	 qrHTbfSLDxKmyCQOFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFsUv-1xlnKm1K3z-009e5h; Fri, 20
 Nov 2026 21:43:07 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 08/10] leds: class: Split led_classdev_register_ext()
Date: Fri, 20 Nov 2026 21:35:20 +0100
Message-ID: <20261120204246.6645-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120204246.6645-1-W_Armin@gmx.de>
References: <20261120204246.6645-1-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:n1y/nTAFJ8hd0ST/RJ70YDR//YyHSssJIxZWr5o898p/igy+5vB
 2OEciMQRFrWfm5YDgcN6dNupBj0Xe3AFyN6JF81SEgAd/GOe4BG6LCENzyZsHc9R504Krwh
 1xtTznhUfV8L1nlXCQpBToXt8JrmXQxgG95IfnNknLbnVqZIUdVHWqBW3hSdSeIFanoJbVn
 z8iaoCpB+S+YfpTqRn+VQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ijALBymbyfo=;Zn48+LV8mKENd+PiocFBQMO56Xi
 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
 OeJIq1

Split led_classdev_register_ext() into two separate internal functions
to prepare for future changes around LED class device initialization.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 102 ++++++++++++++++++++++++++++++++-------
 drivers/leds/leds.h      |   3 ++
 2 files changed, 87 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 8494a1ca0353..2f62141268ab 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -253,9 +253,15 @@ static struct led_classdev *led_module_get(struct dev=
ice *led_dev)
 	return led_cdev;
 }
=20
+static void led_classdev_release(struct device *dev)
+{
+	kfree(dev);
+}
+
 static const struct class leds_class =3D {
 	.name =3D "leds",
 	.dev_groups =3D led_groups,
+	.dev_release =3D led_classdev_release,
 	.pm =3D &leds_class_dev_pm_ops,
 };
=20
@@ -490,16 +496,19 @@ static int led_classdev_next_name(const char *init_n=
ame, char *name,
 }
=20
 /**
- * led_classdev_register_ext - register a new object of led_classdev clas=
s
- *			       with init data.
- *
- * @parent: parent of LED device
+ * led_classdev_init - Initialize a new LED class device.
+ * @parent: parent of LED device.
  * @led_cdev: the led_classdev structure for this device.
- * @init_data: LED class device initialization data
+ * @init_data: LED class device initialization data.
+ *
+ * Initializes a new LED class device, but does not register with the
+ * subsystem yet. Useful for performing additional initialization before
+ * adding the LED class device to the subsystem using led_classdev_add().
+ *
+ * Return: Zero on success or a negative error code on failure.
  */
-int led_classdev_register_ext(struct device *parent,
-			      struct led_classdev *led_cdev,
-			      struct led_init_data *init_data)
+int led_classdev_init(struct device *parent, struct led_classdev *led_cde=
v,
+		      struct led_init_data *init_data)
 {
 	char composed_name[LED_MAX_NAME_SIZE];
 	char final_name[LED_MAX_NAME_SIZE];
@@ -564,12 +573,52 @@ int led_classdev_register_ext(struct device *parent,
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness =3D LED_FULL;
=20
+	led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
+	if (!led_cdev->dev)
+		return -ENOMEM;
+
+	device_initialize(led_cdev->dev);
+	led_cdev->dev->class =3D &leds_class;
+	led_cdev->dev->parent =3D parent;
+	led_cdev->dev->groups =3D led_cdev->groups;
+	dev_set_drvdata(led_cdev->dev, led_cdev);
+	ret =3D kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
+	if (ret) {
+		put_device(led_cdev->dev);
+		led_cdev->dev =3D NULL;
+		return ret;
+	}
+
+	led_cdev->wq =3D leds_wq;
+
+	led_init_core(led_cdev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(led_classdev_init);
+
+/**
+ * led_classdev_add - Add a new LED class device to the subsystem.
+ * @led_cdev: the led_classdev structure for this device.
+ * @init_data: LED class device initialization data.
+ *
+ * Adds a new LED class device to the subsystem, allowing userspace appli=
cations
+ * and/or kernel consumers to access it.
+ *
+ * Returns: Zero on success or a negative error code on failure.
+ */
+int led_classdev_add(struct led_classdev *led_cdev, struct led_init_data =
*init_data)
+{
+	int ret;
+
 	mutex_lock(&led_cdev->led_access);
-	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
-						  led_cdev, led_cdev->groups, "%s", final_name);
-	if (IS_ERR(led_cdev->dev)) {
+
+	ret =3D device_add(led_cdev->dev);
+	if (ret < 0) {
 		mutex_unlock(&led_cdev->led_access);
-		return PTR_ERR(led_cdev->dev);
+		put_device(led_cdev->dev);
+		led_cdev->dev =3D NULL;
+		return ret;
 	}
=20
 	if (init_data && init_data->fwnode)
@@ -588,10 +637,6 @@ int led_classdev_register_ext(struct device *parent,
=20
 	led_update_brightness(led_cdev);
=20
-	led_cdev->wq =3D leds_wq;
-
-	led_init_core(led_cdev);
-
 	/* add to the list of leds */
 	down_write(&leds_list_lock);
 	list_add_tail(&led_cdev->node, &leds_list);
@@ -603,11 +648,32 @@ int led_classdev_register_ext(struct device *parent,
=20
 	mutex_unlock(&led_cdev->led_access);
=20
-	dev_dbg(parent, "Registered led device: %s\n",
-			led_cdev->name);
+	dev_dbg(led_cdev->dev->parent, "Registered led device: %s\n", led_cdev->=
name);
=20
 	return 0;
 }
+EXPORT_SYMBOL_GPL(led_classdev_add);
+
+/**
+ * led_classdev_register_ext - register a new object of led_classdev clas=
s
+ *                             with init data.
+ *
+ * @parent: parent of LED device.
+ * @led_cdev: the led_classdev structure for this device.
+ * @init_data: LED class device initialization data.
+ */
+int led_classdev_register_ext(struct device *parent,
+                              struct led_classdev *led_cdev,
+                              struct led_init_data *init_data)
+{
+	int ret;
+
+	ret =3D led_classdev_init(parent, led_cdev, init_data);
+	if (ret < 0)
+		return ret;
+
+	return led_classdev_add(led_cdev, init_data);
+}
 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
=20
 /**
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 6d00e6f44126..def7166f062a 100644
=2D-- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -18,6 +18,9 @@ static inline int led_get_brightness(struct led_classdev=
 *led_cdev)
 }
=20
 void led_init_core(struct led_classdev *led_cdev);
+int led_classdev_init(struct device *parent, struct led_classdev *led_cde=
v,
+		      struct led_init_data *init_data);
+int led_classdev_add(struct led_classdev *led_cdev, struct led_init_data =
*init_data);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int =
value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned i=
nt value);
=2D-=20
2.56.1

