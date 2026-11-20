Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207429;
	b=DwiS5fmR8HP3NUL83cL0Nj1jzmf0kcKL1+wgNJlFdmZrLs/YxPTcj5MozJmRN60MscSh
	 aEYRJxqDA1xUbtseCLGwogScIWrHqqnUFUxIC4G0J2xub28YYjEMlZcuqmbe9o5xQJ6YP
	 ybwO8gQb+TSCdBrOf3MAKvZJQZEK7NbD7QvZ2bGn3YltcdlTrs/LLwQk+MwmFNVtlCAi5
	 qIfv9czKYBWG/iS1ElaJZFmj5lh+ARmw9OX4stlBlXA/9KVbOl7lG0OwIbGZt0yDsNfIA
	 O6J7fOjVwMILBMujpBxoySokMYPlPsB1jMROSCNAYPtMcRT6QInQUq+cPtemcswp3Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207429;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=FwdJjzqq42M/cPurbBvKsg2cu6LzpoePJSnBK7Qtwvs=;
	b=eZjXQQ+0eMShk1oubc7vyiiEEzitTPpWhmW6AZyupuHpVdQQcx3wggK4lRw0Ke9pTOeU
	 KA7AyFmbGc/mykFQn2vzaU/AvaispQpTs9rcuBVTMROTbU2m5LMaY2/51O8zyMiSQ/EEn
	 C1QSOKmZ7L7UnsxqBK9b8vJcYmxxaNGi9NtLWA7Xz1DsHMZBssdmxvewGiot2+xROUXJv
	 n+qb7OkVdG/Ex6HCyIjOfCAt/0+aZZmzVJI5RarfPHt4C4pjqwCLXNu/6EsPvypCHjgCV
	 yPxMMjoQrnbhLUa6tNt5DTi/5kkSg57CNED/8eM7R1rstj3FNkAN5SDwOgQUqTl+rKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ocVNPuxg;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45142606A8C4
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45142606A8C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ocVNPuxg
DKIM2-Signature:  i=1; m=1; t=1795207423;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:fQRjD5A0A5qAcibHVPceUvzXm5DV
   gXLmGlmDxh1Dynhl9CYPu+UJMihz/D6c9lKilT7pfzkKXVHRdHjIyjld0dzYvAf4UhEmbIJ0qcI
   FoAwlpLtCtIHi0PT8lZdpDJhLaLuaX0Sz/Pofhntak4vr2tItNJu9Skk4RmPLl9fr7CE1B+0Ems
   ev9PLkMe/ITLQZyNhOtCAgp3ydMuhByzebViQuUkmpMU6xDgVgxR5Y5o2Jf99FcEya1a6LPy2T4
   ObvEr8sRFFJ1qWR9V6Za31osqYuN2dEseNFm84wswd0YmTNU+eP1/0Zg2VptG+c5J7082NFGBOb
   UTe1ltXFHtvXaQ==;
Message-Instance:  m=1;
 h=sha256:
   VbaDFnKDQ1gf24YQ9PaQPD6IWs2teAVldkNWSCxCsO0=:
   VEgo1Co1lModFckcW0bCGHjCNbpM81bm9laig2rLt6o=,
  sha512:
   htjpfP1Y8yV4PrhyCX6Z7etyqvYntDrIuW/kKOT40bDT72FVC3dhMQOml7ATOqEsIz8gSpKH5LSGN56bAzCfHA==:
   VY6PvLymUYLsVAP1yzouToojpSDwVWE54e9xBsIRtHDskSaLN04fGj+5wzP6AmGxq/2ZTRXh+Lgu6P9BACpNCA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207380; x=1795812180; i=w_armin@gmx.de;
	bh=FwdJjzqq42M/cPurbBvKsg2cu6LzpoePJSnBK7Qtwvs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ocVNPuxg1MKTBr73lDgfDCA4eqTk+JjlCfFUtM5D46blBwD3Vs1NcAmyVmN4kH+v
	 6UqWsROT7WWlhPBZWa2FAgth5J1U6LibgyN7KgZ7Dm+FdF6vSjaJLfCajo8nRsQnZ
	 3il2tRdBNDA8cmQNnnqjC27cN9cyOTp0i26FNHtQOag9VXx0C8wywepdNO/nqJd0q
	 vUS1ktbO2E5KGXTAbfuzJWSO8aPi0dhi2LWyBvGIN97DbB6y4m7N8KoSWdISpDPRq
	 BnE5zgwNzxCGxYLKz4bTdgULUskTita+Nk9/rzM2aJSs5i97OwrlkEKwy54bo1KSC
	 LQHkGTbBSra1daA6Dw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzyuS-1yRGvl3WpK-00uVce; Fri, 20
 Nov 2026 21:43:00 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 01/10] leds: class: Constify sysfs attributes
Date: Fri, 20 Nov 2026 21:35:13 +0100
Message-ID: <20261120204246.6645-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:BmplDn8VQ+9rv6gm6lw8caYnf9S0fT+UFcryZ7/hRvQIm4H8Dvq
 xmJdTQhkpX10yp9nN0IGbhBcx5Dd2RGAQad6P6yI/DlJ3vD4P9b905hJlaVI46WlGmROMeS
 2FC4aZVKq4bov9z9cHOGFWLlJ/7jbHmKKoQVDTY6nW4hvx0qIVKmD5Xe0YWCc78VhdGBlF0
 YS1TDRKLKHd87OrQ03BUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dGuuR6cTaO8=;t2Ku5QhipPOr7cnoZX8CAK7y9Xb
 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

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index c8529003dbe1..135905dba47e 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -27,8 +27,7 @@ static LIST_HEAD(leds_lookup_list);
=20
 static struct workqueue_struct *leds_wq;
=20
-static ssize_t brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t brightness_show(struct device *dev, const struct device_at=
tribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned int brightness;
@@ -44,8 +43,8 @@ static ssize_t brightness_show(struct device *dev,
 	return sysfs_emit(buf, "%u\n", brightness);
 }
=20
-static ssize_t brightness_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t brightness_store(struct device *dev, const struct device_a=
ttribute *attr,
+				const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned long state;
@@ -74,10 +73,11 @@ static ssize_t brightness_store(struct device *dev,
 	mutex_unlock(&led_cdev->led_access);
 	return ret;
 }
-static DEVICE_ATTR_RW(brightness);
=20
-static ssize_t max_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static const DEVICE_ATTR_RW(brightness);
+
+static ssize_t max_brightness_show(struct device *dev, const struct devic=
e_attribute *attr,
+				   char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned int max_brightness;
@@ -88,19 +88,20 @@ static ssize_t max_brightness_show(struct device *dev,
=20
 	return sysfs_emit(buf, "%u\n", max_brightness);
 }
-static DEVICE_ATTR_RO(max_brightness);
=20
-static struct attribute *led_class_attrs[] =3D {
+static const DEVICE_ATTR_RO(max_brightness);
+
+static const struct attribute *const led_class_attrs[] =3D {
 	&dev_attr_brightness.attr,
 	&dev_attr_max_brightness.attr,
 	NULL,
 };
=20
 static const struct attribute_group led_group =3D {
-	.attrs =3D led_class_attrs,
+	.attrs_const =3D led_class_attrs,
 };
=20
-static const struct attribute_group *led_groups[] =3D {
+static const struct attribute_group *const led_groups[] =3D {
 	&led_group,
 #ifdef CONFIG_LEDS_TRIGGERS
 	&led_trigger_group,
@@ -109,8 +110,8 @@ static const struct attribute_group *led_groups[] =3D =
{
 };
=20
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-static ssize_t brightness_hw_changed_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t brightness_hw_changed_show(struct device *dev, const struc=
t device_attribute *attr,
+					  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
=20
@@ -120,7 +121,7 @@ static ssize_t brightness_hw_changed_show(struct devic=
e *dev,
 	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
 }
=20
-static DEVICE_ATTR_RO(brightness_hw_changed);
+static const DEVICE_ATTR_RO(brightness_hw_changed);
=20
 static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
 {
=2D-=20
2.56.1

