Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209917;
	b=VBiRaVwlxbX+0RS8Hm9FnzWgxc6/qjjBIypnPaD+sEQ3Kmq5myA3yebihsBv+o4olWaR
	 hRvNNzUeBYrLRqpIKr9fVAFHB5RLSQybpjzQAPPo3XR4uKRSeupGHeRYMNd/sO/ohUClJ
	 JdDh03rJejow66kZv33bdZkWVgAr3/kzoLaNYN0csGyjDAox5uSQvyzWEDI1ciKVMJMif
	 YMpw2jb5E9+2vkBJgVW3fd3AV9jovhvqCSqeeNvV0OS//5lEh7uGNlbqXChZ3LB4OaXBI
	 GP399g/nJPyzbUu8cZAu2ZFjr9hohvXZG3S+fH8+Yg2Ia7a7zio/NsUbYKiJgRsAwSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209917;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=FwdJjzqq42M/cPurbBvKsg2cu6LzpoePJSnBK7Qtwvs=;
	b=ZS5oLeWK9W/GL+rMBFxkX7FKpfZrQgqCxybeoEtW7ZDcbU3d4YT5ZNfsLkZiguJNTj2M
	 DZ++JZzVrQetSUNXWmnA34W+pdqMQWAtj2gv+TYFeseJDyOWewdk2WfrDU8rTfP407ADX
	 FOQdraXDPbcsgcMv1k513zk5/yIrqS3SE/+ihFhVjo4rl5kOF43BT15DqHIPf/pV81LS4
	 ACUYdrx+jvQC+X2GG2NOxHN5yMWBa5JK9VjDcsXS2IXcF3yrLSBaZpbpotb3nxLx5v6Je
	 ZegbWHdb+xOpY4KtlEw39a9pXv1g/mfxV7Emdq1wLsG0vottH2Rk+rYl4MQyz9m+ONQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rlZMCEP0;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD1606A339
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFD1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rlZMCEP0
DKIM2-Signature:  i=1; m=1; t=1795209910;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:KUIvbVzen+G1FkyrW13zYPzRhm/h
   Kg6etArt7SzINnKgYIMai39qKgcFOwNZkEU0xSDcEiuXmFrRx0EcM+KbmjXg10XhI9pu009FqDa
   ayNmNLfvvqEMxtjdubrbzAY38UC2VUuyeCI+8nvwacpfZazuxivW3cb+olUzAhctkPAnhMENGte
   CG9tuyaoYUySAl32Ul8SA5AKBedj2yamGvUSlkuU93+hm4E8HorwawZZVo6DQGSLzMBntrhRZY9
   p8hB3rSVMPbU96fdtTedJGgu5vSJbzOURteAzZTVYGJ1vacbqWoFYPBaGdAAaKXgcYda4AIPJZm
   QJvYvoPhA+tOLw==;
Message-Instance:  m=1;
 h=sha256:
   eZdxRgh2obzRj+VckpMN3zKf4+Qf/i+yUcMDIcGiFug=:
   VEgo1Co1lModFckcW0bCGHjCNbpM81bm9laig2rLt6o=,
  sha512:
   IxWKCIzZ85897ymRoG7gKKSBHs3ChAy7xUEmDZrHO4q2xWuHwjMaKVrzk+mo2rQDTr4AcpQl2xhCXsJ7I88lLQ==:
   VY6PvLymUYLsVAP1yzouToojpSDwVWE54e9xBsIRtHDskSaLN04fGj+5wzP6AmGxq/2ZTRXh+Lgu6P9BACpNCA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209877; x=1795814677; i=w_armin@gmx.de;
	bh=FwdJjzqq42M/cPurbBvKsg2cu6LzpoePJSnBK7Qtwvs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rlZMCEP0YULCAUtu5B2+3QfRLyE55UmsAKVS5KHK2zTdfhRdUC+0m/x+5LpcggBa
	 KPBV7HeNmQ7Xq5CTMKUYaSB/K3zzHOfX38hVH48/jwFJ0wCCKI/V5gVO24+YfiX/L
	 uPhUQVOnTta4OzxhWqbIAQaKkREWPINdMzI5E70DDYs88f2tFQLJiZiYEc8+cfpLo
	 gIvUA0a+FoSQdeSrvX4Lfg2T5EXckZ3MHohed897D/0MHleE24FuE1bX9FFlPPwav
	 4qAho5dIAyCFVxXPJ0Kn0eL9CLgC+exaop/Zg91UuVMYvGqCYJ8xu74n5hDKb86Vp
	 d9VjUJZrrT8LPxUHWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1xpkwS1g6v-00K1zB; Fri, 20
 Nov 2026 22:24:37 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 01/11] leds: class: Constify sysfs attributes
Date: Fri, 20 Nov 2026 22:22:18 +0100
Message-ID: <20261120212431.152081-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:uxULmmXI8fHy7GvUIzJVEuRn2e51atvS/HdRagI1+lOsVRhwQEw
 MlUDRqgQ4eakyHzKcKY5172DmZ+amMTrklRWH52RUeINQYMpfy7l0m0IfEZS+BllXLbP/Dj
 Hmhk0cuYds2SqMQcUWRalDnVedMy7THQ9IPCOWrOHSm+ny3AqpxmQB3+PzGyLxeRSts3on1
 LLmFP5OIr+79sYDwGqjbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZGNIZBiULOI=;zAUlb63KchfTRHHSuFwoYqEr+g2
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

