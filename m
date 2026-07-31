Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91323FD15C
	for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497839; cv=none; b=mP9c6yyzoo9NykVoPvJZz2IpfmVu8q8TfGnue+ebirF5Aoh/bfQsPrWgDbK1IsKEPpOcNUYbi+yJalD5/Xu2W1lugh+Le/dM0wU89lVawd/XA6xvChcZFcvB2CGQw0xoI27iTjFkqAATReRqXhiAfHD3zcZY9th6e/MP3DqlfmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497839; c=relaxed/simple;
	bh=Fsi9naHLvq24ntJl8U1aGARdwDxfue5n7pfYhUOdjEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqLeNgHmbWtjjSutd15UfUIyDPf1CEY4skDIhdRiBI+Uni/4cfwkntJb92ZgyZch/GrGEZXO49twzDCuyY8IEWdPd2cjjmDcK3pbPX6YIAXWLE1JjW9W0eCUoxVqipC0wE6XfP16LPrP8pXarq1qo5NJ9ahdQOLkHxWPe51kfuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A95vPldS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A95vPldS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15d111ca99so89822666b.0
        for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497832; x=1786102632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HoJ5QEzgIc1R//Ldk+eAj0/fHRhzYHI0+TPDQsoclNc=;
        b=A95vPldSdrEKSwrXHx+iMhHhdBfisS9tpnWPOflxrJLJZIPH0r1wtS2TDjDMg+Ult+
         v7rOWz9LKBtts4zSX0o1BOouk7Kx8qlwxWXE3Fx/m89bkEUQ6g+bXcRozJh54J4hMv0v
         HCS5PlrQ24CWu2VyyG74Jp8g1Y66adoBx8Kucuvw32CAxqufcywm6cvz90PSDn1t+ri8
         qfhgA6y7QfkwLXGuQpCpNsCqpKBdd1ECEuY6F/nYmcny9urYKRMJ6D/WMG5+bfoZPegD
         Qi9wfHv1sVRvB7LGjQP9kciplQisaj8FosdMrlueI6B+Dh7WkcUBfFj+dWSSCxN4h5iA
         ZYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497832; x=1786102632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HoJ5QEzgIc1R//Ldk+eAj0/fHRhzYHI0+TPDQsoclNc=;
        b=X7oNbsumUOavJrRFydJ66b8Ag0lm4FkoA3irrvXOTBikLAi2Gq5VzuH5yWmsBSLqqv
         JV2hItvf8NFV2dhclImlufy149G4ZeZhxaF89MrULr5rA6j+jLHRSAVcFmLAIbmpIGwi
         H6nuYkRMAIp8+N2t2ccTK0DLFLLZLzJfvbDGa4FSyKfKt+I/dRJEug/qgWHDvvlbU7qZ
         XV0MazjjOpk+WRN6gkxlyOpF3xl5CP0L2W6lXocp3d2ILFNqfSup3dcreDZ5PgW4739b
         ObWuYI8v8g66wcSmMUAeWrvaUNGDemW+OTlAYbdtR7H83O/lUj9exvhrvdwD+/W4oQDt
         mZRA==
X-Forwarded-Encrypted: i=1; AHgh+Rr49yAH3izWmzuVUBJrli+xdgMFgZ60qXdzgIARqSc3i0DQh++QZIjmXyje32jsUOj71ZOwElgSrtIL@vger.kernel.org
X-Gm-Message-State: AOJu0YyZjBHacaqKnaYMrYF5v+66/HYLzJoj8Qh1KwUJWjxX1phMfttV
	cJxQaKLZ0MSFc73+G4xjB1oLPSiQxdXJOTDZ4QbI5oxQ+Cqt3JXmP9q8
X-Gm-Gg: AR+sD10fZe+o+EGDLbNxXv9VBJmjnXS+NPwV/JNkGfph/l0ttllsTduHwI/0QrFASHC
	MQF6E4AQBD57LibIx8Z4BBTMpfQT0rxjsbBkdsce3VSrX3K9bwaSX/DKXsxUx/RA5OrMjsEWAqX
	DSOCJk1uP4JtAetJ1KJXbUjSW1iCKeFkzbBb/vehgkBFYGWVR6Mw+MVfJB1jJxreOEFa/lbXnFM
	l08eI9UgJA2tgYCS2XVBJX92n5e7WzOoV3eNTHzvZins5ENbv2OZ7G3q93fQuNBZuY0d7USeQnY
	HN85BL5FJhVs4trUEhWvBk66K/LLYWfnbMnaJiI/zI6gp060Hd0/zB9eVBYaC5O1tpHIzuT4AqA
	8ueqtsSI0I5PhshxirpVHuXF3VPfT7/nOnYpTXzhVSglMbiw3dOcU1WeO8QCGgyEPShMNoF7Byv
	PRBhpAyNFRAw6B41Cq+GGkgkJUSEepuvvJt1V7Bm7X3/Tsz7wmDiTtU8Xbe1P7oMInL1x32Y2l5
	xXIOC7rpg==
X-Received: by 2002:a17:907:c78e:b0:c12:7934:52fd with SMTP id a640c23a62f3a-c1fd250eeb8mr91901366b.32.1785497831684;
        Fri, 31 Jul 2026 04:37:11 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 09/14] mfd: lm3533: Add support for VIN power supply
Date: Fri, 31 Jul 2026 14:36:27 +0300
Message-ID: <20260731113632.158440-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113632.158440-1-clamor95@gmail.com>
References: <20260731113632.158440-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 23 +++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  2 ++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index c7c7e71719ae0..2a63df034171e 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -111,14 +112,25 @@ static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
 	return ret;
 }
 
-static void lm3533_enable(struct lm3533 *lm3533)
+static int lm3533_enable(struct lm3533 *lm3533)
 {
+	int ret;
+
+	ret = regulator_enable(lm3533->vin_supply);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to enable vin power supply\n");
+		return ret;
+	}
+
 	gpiod_set_value(lm3533->hwen, 1);
+
+	return 0;
 }
 
 static void lm3533_disable(struct lm3533 *lm3533)
 {
 	gpiod_set_value(lm3533->hwen, 0);
+	regulator_disable(lm3533->vin_supply);
 }
 
 enum lm3533_attribute_type {
@@ -332,7 +344,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 		}
 	}
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
 				 LM3533_BOOST_FREQ_MASK,
@@ -446,6 +460,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
 				     "failed to get HWEN GPIO\n");
 
+	lm3533->vin_supply = devm_regulator_get(lm3533->dev, "vin");
+	if (IS_ERR(lm3533->vin_supply))
+		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->vin_supply),
+				     "failed to get vin-supply\n");
+
 	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt",
 				 &lm3533->boost_ovp);
 
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 5710e88da45d2..8f72dd41e8f02 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -22,6 +22,7 @@
 struct device;
 struct gpio_desc;
 struct regmap;
+struct regulator;
 
 struct lm3533 {
 	struct device *dev;
@@ -29,6 +30,7 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
+	struct regulator *vin_supply;
 
 	u32 boost_ovp;
 	u32 boost_freq;
-- 
2.53.0

