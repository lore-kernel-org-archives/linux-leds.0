Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EDA4C9DF3;
	Sun, 18 Oct 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331653; cv=none; b=IfIV6lxgU9pEGg654TO96dY48WFutmTzVbuYGuZj7mDeOaSwzWVZoZQNr4oEV1YgPeQzoI+/5XzxEXHCyoNGpRdNhD6ju+aay0CjgnXnJDiwXDmn+kdRhvCbE+PrXHMAdBU7x5hcQKOHx9kUOodiSRkz17C3XObp+XfJk6OFUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331653; c=relaxed/simple;
	bh=cxCSun2bIVgjOtFE6MgnDTb+aVgeiSumXPMKNXQz748=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM6hdNwZYO2yYYRDq4cPDgAwtXVWkisqE2ASgF9KUiJVIVjLhJ8Z3opKArMgoq5TgQ+g0RzUssN1ydo5aUhMl3OBq/nrwQmpSmgh+itS5ey28Hp1TPH+sv40lEDo9FrAAvVUdpRw+wZJi0ni/kPmFfkDlbO37H7n8vmipnwvL8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=h9OY7fsi; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="h9OY7fsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331638; x=1792936438; i=w_armin@gmx.de;
	bh=l6PtOB2qvhcSg/AVKyrizz3kFVkWmM/s0e8gOWsPI/o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=h9OY7fsiqaGuyw8QhczHgcP81jrGiJ350wmZGUvoePzmYBVSkQp0f0GkJZEsYtgM
	 3YL8SqDnW4k6bXba543JpSwHNwfuZlJmXh4S20ckSzjtQeF9k1tGr7+Jdv3bCl1wC
	 cybtGYeIR4a/KKCGTih+FQYkFwfqjsnMba713oMdmuzYApfJQRHSgsZPzcLxeM4Iq
	 ppoKbdqzzZRmh845By2vLQCtfh0CBBzIQMM5PMSm5mdrXgAuvdS6GjTUfP1fnkTUJ
	 jkf4fmh7EcG7n/QWjaNOHw0mILikAQ31X72mpJoFI3QQEJOVLcKzsV0QNfy52L6k9
	 Hp/wyPEpPPVS1G4ljA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1xJWjS2IFo-001Pbj; Sun, 18
 Oct 2026 15:53:58 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] leds: class: Take the LED access lock when reading brightness_hw_changed
Date: Sun, 18 Oct 2026 15:46:25 +0200
Message-ID: <20261018135339.1109271-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018135339.1109271-1-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pbe/+QYvbMHjAiSTEBJa8Co/uyuf/I+XlekjLo/drq1CqwqSqyf
 nAdherYJ46fcsYmXJPg3+CpM8/p9gSOtHfYArV0fxo/RcmuqN/YYwbeJ8jQl0aSt8rgO1kb
 OKBqojma1lpwN48yntxhORE7fkt4OyeBo5uEZqwvxCQMZRdC73c5HvfO7JhMN2iEdtQMYAY
 M9NqHWeXQvqZ5mO68Ygrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PX3htEh7jrA=;4OdsXtH6I/U3Sh2N3ynj4cGbbls
 +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

Reading the brightness_hw_changed field needs to be guarded against
concurrent writes by led_classdev_notify_brightness_hw_changed().

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index e1f1b710536b..77a0fce03952 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2005-2007 Richard Purdie <rpurdie@openedhand.com>
  */
=20
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -102,11 +103,15 @@ static ssize_t brightness_hw_changed_show(struct dev=
ice *dev, const struct devic
 					  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	unsigned int brightness_hw_changed;
=20
-	if (led_cdev->brightness_hw_changed =3D=3D -1)
+	scoped_guard(mutex, &led_cdev->led_access)
+		brightness_hw_changed =3D led_cdev->brightness_hw_changed;
+
+	if (brightness_hw_changed =3D=3D -1)
 		return -ENODATA;
=20
-	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
+	return sysfs_emit(buf, "%u\n", brightness_hw_changed);
 }
=20
 static const DEVICE_ATTR_RO(brightness_hw_changed);
=2D-=20
2.56.0

