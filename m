Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E2D318EDF
	for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544555; cv=none; b=FOxaHqKytR5xDjhO5CoOvM2XmKRJOnVZhJq/U6MZuaqGmGYWGr0ujuoGx4l4nm+Cr9x9/sIbOHmnEqkRJEBGxC/agwOu/YCD+fXwSkS4flesv2/D8QN5v13EPKSv2dmnzsEpujbCDTkWPez+cB/0h/zI/2AR3djsXprBWcNhJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544555; c=relaxed/simple;
	bh=i/josJKYxMimmHvpDbov7hCpwLyf7CTxajFFssnh2zY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5TMC/dQt1BnJtelb7wcGclCsCOwJkpSyTFrESsU5CDd0C0BLX/LXUMU9679B9yATFdI7LqyMEgUIWy3nTMhfS96eP5M2OcDOicYes+QCNBJV25YUJOXTs2P59xJ8KVBzXyw3jzIc0nJ4aktJVomw0//RWFsMqFjVQZDglBIo1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Le+fJioB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Le+fJioB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso70947835ad.2
        for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784544547; x=1785149347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojZcDgSf316rTZ8nXfseEZiNiC55VD1Jwdp/gjgYdz4=;
        b=Le+fJioBdSg8LZNKmTFwI80ES0VT0YKA/2o+h+QSBaJ241HF+mktyV1YvTbiuVfO0s
         EIgOmbhDZ4X0ZCkd2+YzcL8WtO0GhUWsmB7f1Aqo4MHehKqpZMYbxriDulZpN1TyXXBU
         9zKvPrnJSPeuCtx4laxSfHLWWFj63wqvaShOocvqchhP8eb9ecRyJrLodSPkbihbyW9T
         1ACJnGfpoDIZTb4mDhbsJnt4boKYQoye5Isoc0h0Kf5ZqF5BjymBUZhT7RRdTGUfC98L
         WWMarudgs/Ciru6qvjZvxWKVSuod5FLhy9LZDhpO3Y6l6IFUXZ1NYkEo1MddGgZQOuSf
         bM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544547; x=1785149347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojZcDgSf316rTZ8nXfseEZiNiC55VD1Jwdp/gjgYdz4=;
        b=Ezy3CxwamCmss52Z2pBrpl1ybeVKXNG63K590dy+HhpmODDF+stERpg+L+kIiHMx8E
         Xvf47AWCBF7jpf6afIBHXifMcf4LfK4WDMS6TImcnJ4LX17NynxlpdZEKFqSqeJAY8Hb
         C+bE0WggEqXNfzm+pcMIZrvratbpkL1VFEhM4SGoW8pZ8X0PEO92Fa2CqqhOSzax7E7+
         DIpMk3BmoJaxIExUUeXuA5QPGxA0BCKs0/yZx1HVHR6U8wSXdxFzy4dLAp+FoWLwAECK
         CNo0t4sJnaLDHm+fcVvgCdqGSb67X8HDsrWpyL/pjW8SPGWZT1cEd+GhqMkqjJfXRNT6
         ii+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoTN7/VGdYAGuc+QlRZVxaTWS0VdacZKV1doRhiUEGjAJGTLCDRIAaIymxglpYPyym0CXNMRqmIAZCq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/3/DROccCN/dF3E2cx8c1IL9hhRlww1WMJnQnaRXpddryRUU
	NjbG9RRY0Ne5cZpqn+k7GkWLTLSNNSEgoqkVdjERkChog31oT3ZyTzE=
X-Gm-Gg: AR+sD136BxxMVsUlbH+cPf4pPto77Jn2cfZAz3F/nAwppnNByC7qb58XeYt9CC+5en9
	gJk5BVnb9auuusXM8nB1qJ9gxM5Zddw2HHQIbqO1kAC9M9wEdN8uZrn8P41tXVKMjaWfKdYR1ub
	HKlRmhmk8WOZgY554I4QTXJxRJRti2RtVeJzhlVjrsBjkAmauFfu25zMHs1hSImi3xlP1rQjA0c
	WPZ3LHaQkIDJI0sP728Oi261qsyNFB3dlkyuc5/GK736+MB3vVYneP4qHOFUti28Fhm8sHpuE4+
	F/l4vlT/NCaDRNkNqn/bD7WVBr5v9gk82M7nENq8PL55HmYkdgH2S5dUa9SNpyQotKd+/QlajGZ
	Qc5shLOFMXy6IhHRppIFTiOPb9ve4HVGL6UCoLhkGR0O92xxM/fxQyseIyNfXvYKAqgQoTEsJds
	+3K9nlCyIJ3CrAZ72Qr4DMpqm03a6v2Mi7RMC4
X-Received: by 2002:a17:903:2f84:b0:2c6:a012:6241 with SMTP id d9443c01a7336-2cf34850f28mr154972935ad.6.1784544547104;
        Mon, 20 Jul 2026 03:49:07 -0700 (PDT)
Received: from t-rex ([2401:4900:c200:8f2e:8d2c:f805:595:9600])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm39252558eec.15.2026.07.20.03.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:49:06 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: s.trumtrar@pengutronix.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] leds: lp5860: fix LED teardown ordering
Date: Mon, 20 Jul 2026 16:18:55 +0530
Message-ID: <20260720104855.98186-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

The driver disables the chip from its remove callback before devres
unregisters the LEDs. LED unregistration turns the LEDs off through the
driver brightness callback, which can then access disabled hardware.

Unregister the LEDs before disabling the chip, including when probe fails
after some LEDs have been registered. Keep track of registered LEDs so the
devres actions can be released explicitly.

Also remove the early mutex destruction from the SPI remove callback:
hardware teardown takes the same mutex.

Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/leds/rgb/leds-lp5860-core.c | 13 ++++++++++---
 drivers/leds/rgb/leds-lp5860-spi.c  |  4 ----
 drivers/leds/rgb/leds-lp5860.h      |  1 +
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index 75498311b080..9646d3985239 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -149,12 +149,11 @@ static int lp5860_init_dt(struct lp5860 *lp)
 	struct led_classdev *led_cdev;
 	struct mc_subled *mc_led_info;
 	struct lp5860_led *led;
-	int led_index = 0;
 	int chan;
 	int ret;
 
 	device_for_each_child_node_scoped(lp->dev, multi_led) {
-		led = &lp->leds[led_index];
+		led = &lp->leds[lp->num_leds];
 
 		init_data.fwnode = multi_led;
 
@@ -188,12 +187,18 @@ static int lp5860_init_dt(struct lp5860 *lp)
 		if (ret)
 			return dev_err_probe(lp->dev, ret, "%pfwP: Failed to register Multi-Color LEDs\n",
 					     multi_led);
-		led_index++;
+		lp->num_leds++;
 	}
 
 	return 0;
 }
 
+static void lp5860_unregister_leds(struct lp5860 *lp)
+{
+	while (lp->num_leds)
+		devm_led_classdev_multicolor_unregister(lp->dev, &lp->leds[--lp->num_leds].mc_cdev);
+}
+
 int lp5860_device_init(struct device *dev)
 {
 	struct lp5860 *lp = dev_get_drvdata(dev);
@@ -221,6 +226,7 @@ int lp5860_device_init(struct device *dev)
 	return 0;
 
 err_disable:
+	lp5860_unregister_leds(lp);
 	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
 	return ret;
 }
@@ -230,6 +236,7 @@ void lp5860_device_remove(struct device *dev)
 {
 	struct lp5860 *lp = dev_get_drvdata(dev);
 
+	lp5860_unregister_leds(lp);
 	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
 }
 EXPORT_SYMBOL_GPL(lp5860_device_remove);
diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
index 5e0c44854a68..e1565eac90f9 100644
--- a/drivers/leds/rgb/leds-lp5860-spi.c
+++ b/drivers/leds/rgb/leds-lp5860-spi.c
@@ -70,10 +70,6 @@ static int lp5860_probe(struct spi_device *spi)
 
 static void lp5860_remove(struct spi_device *spi)
 {
-	struct lp5860 *lp5860 = spi_get_drvdata(spi);
-
-	mutex_destroy(&lp5860->lock);
-
 	lp5860_device_remove(&spi->dev);
 }
 
diff --git a/drivers/leds/rgb/leds-lp5860.h b/drivers/leds/rgb/leds-lp5860.h
index 940be0c6e8da..ce30fb5596c0 100644
--- a/drivers/leds/rgb/leds-lp5860.h
+++ b/drivers/leds/rgb/leds-lp5860.h
@@ -258,6 +258,7 @@ struct lp5860 {
 	struct device *dev;
 	struct regmap *regmap;
 	struct mutex lock;
+	unsigned int num_leds;
 
 	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
 };
-- 
2.55.0

