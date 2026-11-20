Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207394;
	b=5GhpnTeE7NKV9RorBaYDeBs7RvxoiQt8YuJTvi56wdYRhY42UIItCkbEjSMgs/Z9gIAY
	 v6n3weGfj3+FKiK5O5HZYAMhx0wljmMlpKivrO+0fuqjDaIFH0Grdeez74x+rY4dcJXas
	 UcEQqPCno+lrwFm8gKqi/FJKYSERGwGa2MkFDi3DIr1GXqFRxviuvefKHOy49c8UPSgBZ
	 UMd8dbRZNQSRAOq6BKMo07i9Iv98BasdLCEZ82yEDqBr+wCejXjZieKq5QfFuTbPrRaiO
	 G1p/6splgXtW+lVrSptgpeOfWNB1N1kWqglgvHaMk5J10fNP+RNU+4Zdkm3yT0m7HkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207394;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=vUnzDee9sJwUTkOsyIotnbDeN6IQg0zu8SoD8/lkv3c=;
	b=KfQgYpuRiD88NZ9DQcOM6gUrBS+Fl12yw5ugTnUzovs4/yxZ+7xz0IotWbJu0Ni4Gu3Q
	 /ZmKqWz13yj38BJgiFDE7jl8120pWRs3qHk1TNvZDDFtcSeUb1qXszw0p+t9k64H1rKZh
	 AoPz+rx/g2QDpsYOMA5ZG9AHyBZ+27ue9ejXuXNZH87tXxgy3QzZshCFbc2d2ISnt7KB2
	 GOuuF8qc9tV62o81fRxdRkUOfv1mSlI2I5L+YAR5kC+jYzPjjsHKrwdYaxyuBDLrhy/K+
	 ONp0YjNXJ4CGl+rhhOMEgldAw/yrrPJdXgv23FONILdWjGyx22UIqe+NbQDnki1c+9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=b84ipFa0;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587160780D8
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5587160780D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=b84ipFa0
DKIM2-Signature:  i=1; m=1; t=1795207391;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:Nojj5q9YUwiRp4lCdXffMKa0YUL3
   qn6dSKILWgmtB0ihu0sqM4o/w4caxElJteCaa9EW2VYU2dlam5kJ3BKF2Jx4HV/BWiZ0SlKApr9
   TMZpyGvILOUfteObOoY5h1D/eDjVVUqa6Rp6gQud4OaG/w8NPXzQhopJnf0ypIvEzV2veIhkzsS
   W8U0B1Zk0ZD4b9JFtstW8UG6TpZijENDKeiQDAXALK33sws93mAtBRxL6xqPydFf94xBrEXgC/B
   y40nbossrdG7WkLF8GMQsckhJwctizNM5xd+aljdwmGC/lFPaHMfr8zdraUCtWulaiHRltIL55I
   rGpS/I0DHrqDtg==;
Message-Instance:  m=1;
 h=sha256:
   40b1krXO1ouZc5mHJm9UsV7JCKqV1B1K/cXLG2v387Y=:
   yAoy/0tQ9kbXRY1vnazjGstaI2PMDJlNR8r956Zkwr8=,
  sha512:
   T0/euWrttGzfrh5dU8DAduifOeZSfCRl8bGCxfsLn4s1bDPpEE4A82lSFdYqKH7XDXPc+bp26sh0b5ppJklFrw==:
   B3beKPHEydch0f4Jdi4bd6Hq+cGZwKHG/WabaXTbho93JwFVlxQzjVkRBQsP35yKp/83iztQ/tqkJEtTatj5kw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207385; x=1795812185; i=w_armin@gmx.de;
	bh=vUnzDee9sJwUTkOsyIotnbDeN6IQg0zu8SoD8/lkv3c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=b84ipFa0UlUugPTv4Q1mXSU3z8JDwiMINM6IZv/NI5OnbRJif5vtjFoIFO3I2HZj
	 oLe+E+loYx8MKI3ylZkCGc8MzK+7BiWl6C3FNLY3IlZmKkspmiZQ2GxmSHvslgZ90
	 ydEhZwrc1iY3Yb5h10PJAq3PIW3w/e4D7K2IIYETvaA1ITh+6yWLuU4zqmgZO8Z/s
	 CHl2HEo3127uZOfNbZq3toB7Be29saJl4w7aAxNfOV2+NZ+l05jtnl/FU6YESqlzw
	 ECznAu1fyHu/jtE71qTUEeajV4HpnKni7hk83hIf+Pd6PVN3rQ7qYUaxK1uW0qKRR
	 Z7vM0sCiYlIzAHNSMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRVh-1y2MFO0g7X-00QRiF; Fri, 20
 Nov 2026 21:43:05 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 06/10] leds: class: Access brightness_hw_changed exactly once
Date: Fri, 20 Nov 2026 21:35:18 +0100
Message-ID: <20261120204246.6645-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:cZpb/i/Yi7LMZCmtuYMHGb6ue6AEqAm3PPQS2TgPwWssYvIwOzZ
 DKYhrl48l/Gd0TG++CikqFe/HQQl249rJlINgTwjjC/AE/SI6g2FvVIgNSzbZlNrNHvbpF5
 BuOrLyj+/jStXMnhVNVIs+qjBAtzZ/kWyPZCTkLgbeKRT3qsCQ3oLASbwwQ4GusThFgecOb
 AJBueAf57LWXTp2mbzd+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Wihk66ts14o=;RCrm19pBmGyDH4BHmJmxW3FkUZH
 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

Reading the brightness_hw_changed field needs to take care against
concurrent writes by led_classdev_notify_brightness_hw_changed().
Use WRITE_ONCE()/READ_ONCE() to ensure that the value does not get
corrupted by concurrent writes.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index fa9803e2ae6d..8494a1ca0353 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -102,11 +102,13 @@ static ssize_t brightness_hw_changed_show(struct dev=
ice *dev, const struct devic
 					  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	unsigned int brightness_hw_changed;
=20
-	if (led_cdev->brightness_hw_changed =3D=3D -1)
+	brightness_hw_changed =3D READ_ONCE(led_cdev->brightness_hw_changed);
+	if (brightness_hw_changed =3D=3D -1)
 		return -ENODATA;
=20
-	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
+	return sysfs_emit(buf, "%u\n", brightness_hw_changed);
 }
=20
 static const DEVICE_ATTR_RO(brightness_hw_changed);
@@ -169,7 +171,7 @@ void led_classdev_notify_brightness_hw_changed(struct =
led_classdev *led_cdev, un
 	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
 		return;
=20
-	led_cdev->brightness_hw_changed =3D brightness;
+	WRITE_ONCE(led_cdev->brightness_hw_changed, brightness);
 	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
 }
 EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
=2D-=20
2.56.1

