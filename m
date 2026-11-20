Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209932;
	b=mHvcaJgebSFarMMEO6HSxIlhnxNjPY99LCqUzsbzAmjmNN1Fik5xyCMm+S0eK4gFffhf
	 P113ZkYE2LAM0mXObag14KZ3kI8UjFrM0B3LiY5qHfsAKePkYdFYipXB9wbhl+2au/rJ2
	 8kKMMm6Y4WaEMWumBTNFtRGWLG7Z3204ZA0r/+++ySFr48TqkHrnLQkIWlCGeYEiEYQW3
	 vBDS774GMTNL3BSm366OQuHa1Zuof/3lst0JaohLzoxqIkvzQeH1mFhaC/6ysTgvcMtBp
	 ERsWz6pTmDRRQpATw7JAKatckMfzMimyjxSx63zApDJZ4T4v3DjAU9cClW1+lCSqduQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209932;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=WwXa8+CibsDkkaEdT1jEC/4regEB6eaL8cAgQiNj2VA=;
	b=NsdLPkwkVvAaYQapNZk97Aq9a4rB9YeZSqPaZnUHY++84ltNFDkuFFqCOZAUAlYWLKcS
	 LiUelDlWRRtK60WKSpVWlJu0VwCkiA4VW8aYgABEaJb/wxjkBuwEQaMmFyKT4oZ2Wm1RT
	 qoEXTPxzS2gb4ePdYhpsuRF2Q+nOY8kPlHrYalTHjztK9zuFDctUFYATigwl3fTdyECjM
	 DzflnKYOTzzl7vM/5BwW+haM/MoLyfCJ419Jjxftb1BHWT5TY1yeHmyQxx3b+2NVhvttT
	 X5DMk2+7magW0teGubcmmjVCJ826Uo5BScoR2Cs7gEKrPR1N5S/Nhpt4KOzjmYAs+6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sGndcmLA;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF97A60A261A
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF97A60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sGndcmLA
DKIM2-Signature:  i=1; m=1; t=1795209927;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:joBm6H071lubprQwYvJcLbU0ivVM
   L7uI6YLOn5iL8WGlUfXplTAYV6l2SZzK9bS1gTDG6rNzgVSd9meTxL/R3ktj0JiGVx1neDhIfJH
   U4XoLwb2eCoCdOhuoQDdeB9aarOHR5Wgfo3l69+ks2evffIrGFb2zonOuk46+sJXFp/0Kr+TW0F
   IfpZsw7HoieRDafO9bUPjos6fXMaGv6TUqwhUFEKvAz7KzKE79mDoJZ3g8A7ubRNaXSzO4w4zt0
   NBdDdQazsyQf6xHLS2Yp6c3yWzfTv/rbuHmgUbqIFRkUQJObo/MXKF37tKk9HvHRYMpt3pGs02V
   JuA/92polsZ2Yw==;
Message-Instance:  m=1;
 h=sha256:
   mL8HxhuUxW8M8GLza84JHgJTmivaNgw6xNxWKn8FYJY=:
   V5hOpu2RXGKhOvfLyq/2Y1WiqN0Z9kXHo25MrUErrTM=,
  sha512:
   iwk1xWGErbxLRFhGwXN9mdvmC7fjP4Fubp4xz9I4SqvWboppJwO8rxjrdAk11Avgb5ZsQHZdBF+JmWOplPyjtA==:
   FuP23+zOhzhZV1Y0C7we+W3KG+NLK4ApphT7LChlHoaCkH50TFNLJRNhLzNPd8JNTGmCXlyxZHUm0fnhqwPl2A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209892; x=1795814692; i=w_armin@gmx.de;
	bh=WwXa8+CibsDkkaEdT1jEC/4regEB6eaL8cAgQiNj2VA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sGndcmLA1jp9BkloDjcEK2Xu15kjzY1cz0q0dP0nCobFxmgyqdJJiJT804o79bkR
	 jbHxnV/5RV8VzFzDFHNP7sT0ln3bRjYNMBst9P9XAnVwAwax2QpuJOrCG2H4MiIVF
	 idfuukk3z2VyCN89zwIOl7hkgMkpKHJ9NnBT7YGVo9tRoUWfPlqdaI+6XgtU/8gxm
	 84XOPhjW9dIzAXm4x7UNMCctUMvBBNRrK+dkGqAplyd8qNlT9fBcm4i/6k9Ncx18m
	 ai3OXAKF7EpnVVCkkylHb6zvPKAGgDqehfUZG8du0jYIv8d96ueg6NdF1E0pvAFQj
	 dqhd6J1+LPAf4xaeew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5QFB-1xVtg62hl7-000A6z; Fri, 20
 Nov 2026 22:24:51 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 08/11] leds: class: Split led_classdev_register_ext()
Date: Fri, 20 Nov 2026 22:22:25 +0100
Message-ID: <20261120212431.152081-9-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:Cn1TYnatjf+Y/v3s32dZZsGsnKS3RkI3ipnhsglXdC14iqwk7Zr
 tWkgNpXfFxloBrLII5wUshQ4LfPnxwzuAK3JCXfvL3OgMQgGaUPns9zw2zYxUTKCTf6/L4U
 w3ekmihkIgQ3VX/o/2Ix6AhoxIPlNqsxD+DL5Lt/KWUorip4ASADyuIyW81s0zWIf/QQNpm
 jkXXZgU95gwpqlpgSXWTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3Jie9eQpkm0=;E6jouDs6mAfwzJxYNYrYaRMl9ui
 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
 YCvSWo8uKqLdT3D5M8zDPPuxRYRQ==

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

