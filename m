Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209900;
	b=4JkV6AjVWlW6a2ud5vkUnRKgf4UY6TISV2sNbO6yU6CZI03blxIHYseo+cakABCZoIpL
	 wkZpud1UDNk0ZCPZWFIiTwK4e9EWyvnFE2MAjnrkjOXvNF3FYdRajshaB5q7wBMBz18Cu
	 4UFbpIrbagar5Y8WUJgy6bSI8/LddMyMc21fBs6UfFy3WgME6TEjFafiDnlQaDkkxGc6x
	 MGeliO0BzO7iK5G6TrGqHWV6j5tivqnRrxgr0buk2Flhanu5uvOk9aUEpVuZT9AwR4qjG
	 85GxlJNFrkJBEoj8Fvv2NcqnHZ0KU2GPcaO4dX/Iss6emZ1GvXrueGtYmnK7++Ncbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209900;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=vUnzDee9sJwUTkOsyIotnbDeN6IQg0zu8SoD8/lkv3c=;
	b=3/O9Iau/oOIyV9gKMoZoPPucO9iU5/F+j97fi3ADW5EufWudIU7P7ox+KnMMExc2nwC3
	 r9b853ObkEp3csKbXhdJiLxyq08dEGxF2imzKH6Wbe7R2ndjJIWNVzmhUgWOvx8Fwty/C
	 VbR0meSFW5E8iuPLQXpqwTST+/HXksG/TtzvvFh4SygJjWpgJYBVkg12PXpqa8CCApURz
	 CkvS6EjFGVqvwhh5ZG3pNhH0wkOYoWSs+eT+uKnS+8IMo1xyo2y34O7mzg3UFHiCvFvNL
	 oM9DyiAZSh/U3HHUZpY9roxCBciOQFKPKpsYkFeYB2C5MceRdCv7bzq6BYeR9CiTrZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=EGFqyZxy;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9311E606A6B6
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9311E606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=EGFqyZxy
DKIM2-Signature:  i=1; m=1; t=1795209895;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:sDKCWCZA68fk6NkW8uq2bkrllf1U
   j4wEbUrF64WwlyR7sTTaHvNJOuHoPnEXPLqmumARkbVMJtfn5XRsNZAPQUeA7YNIuGLp9lo6sWQ
   XZjASOCH40fjFf1t/znEs5yEtrmcC7rvbmRtaWvJap5bxjskl/LFNAbo+kXWCuljMWXBLRFA4Pq
   RTIh9XlGJZEkmFlAoJKkQtPyIFcrDEk4M4KMTRWC15jEWikvBsZ22Oj3Zm5dx18QeBx0h2rnTVF
   n6iRSv6Y1W4B6LTTMOz3mNf8sxsOHYDjTZQ2Ao8xwN8SXfdU3rJ7vfXhw+O7WIpH0fSp3HMnVi7
   r1AsXSpaJWgn2w==;
Message-Instance:  m=1;
 h=sha256:
   TUd+tHv2Y4S8bVHTDCtSPOm03FHFkWdBJNwJUCfAJBE=:
   yAoy/0tQ9kbXRY1vnazjGstaI2PMDJlNR8r956Zkwr8=,
  sha512:
   O1qhhUvPq0tL8pfVpqDJiUnVL8NScx/ywi1LjnVixHLXDkjEmuw8xk0YBRCjXhJ9O9M0DRKi6ku8vokoLq9L0Q==:
   B3beKPHEydch0f4Jdi4bd6Hq+cGZwKHG/WabaXTbho93JwFVlxQzjVkRBQsP35yKp/83iztQ/tqkJEtTatj5kw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209888; x=1795814688; i=w_armin@gmx.de;
	bh=vUnzDee9sJwUTkOsyIotnbDeN6IQg0zu8SoD8/lkv3c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EGFqyZxyNFbGrHrJhK08rc7gVlUpbHAFR4Tj16vTImcJl/7q8xZZu3nKe0yBVd8+
	 gocFU6zMcbSZQTWAtlmUkb5RvfLTOWPtKhWk/Ch8fqzlJlJo1Si6RDKtyYQGWN+HS
	 M9rJeaIyTk/2WvnaCY6MlYS+Fe5BGNX6lsRrQQvNalGfJJyt2ZwxsA5pPl4XYczXW
	 IEe5EzIy6RvujqdCL1a41fBHOmIb26/25S6zSv08QkQeqJqxiH2ZPifCWf0HTxIbv
	 nckOWJ5RD2El82tkNloqBBhl3wgftrI+jX7iNjppTp7hVxRBekbYethOhfOzyNcMR
	 hRz/wZQF4InSHaur3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1yOXWl2GuC-014X0W; Fri, 20
 Nov 2026 22:24:47 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 06/11] leds: class: Access brightness_hw_changed exactly once
Date: Fri, 20 Nov 2026 22:22:23 +0100
Message-ID: <20261120212431.152081-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:wsLQC2jdtpsUwLIYlzxt606YdwUwE9UtWRDPcc1HurDsGlvePV1
 HSvLAAcc+XOqIwL8vy3GozS/qBywQjyj7ItjgVPzpLW2Fmake07nL5PsxOKFl7dF+I41gMW
 bt3iChafYoblzHUigkNZ+tUy+pm3+6gSgEkpo6Hjd92LfI0tkbUz8Kpk3WMLqMXo86Bxlj1
 X6TKNMiB4pytyUIhbyqQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YBLSBp5vTyk=;lPqWJDyBn3WJsawy/BO3/WwQvus
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

