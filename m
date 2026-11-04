Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795861;
	b=Epr2zdUmta9pqpLEZ/Z0tQ+HbPwfrLNzf0E2rnpCkwXgg+qeddrLTQLY5gj3dQ8IhxqO
	 WdJXu7KM9iAA3JSfTrXNZ8GFCiwBWah2WtTMjKiuqZ1Wn/RaC/YQyLeJLw3ZFP4pmDTYk
	 YWAZPr2xe4CIc+E8knVUt3tm+lQeuDtgdFBLgi1Yx+I7UwjbjySKOz5+fmivJhr1OETIp
	 WE+RRru9tdlmyI252QhgF64hjIuTPb1TgyNRDBdZAUBkaYmO5pNAf17fd2QGM9NQescD1
	 MaG7iLESUW3ixEvTvnObmtS+AWTotvopMDqtpUhFuPB+15FFOweIM0DKW5n+A3/aWDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
	b=OaP43nzljrSF/Qhf5Ey8WJMkSnubtynppOrFYKs09Pwvxb2rJMThGIx5k1nQDrpe3aMA
	 Z7nOV7+d6XbvaSzgFII4j78vMj6qrS9nFLPamhis/LlupDVFpu3DYJZHBJkVt4FyeFdrf
	 ANmlhKjDZU+87lx4XGNmayA7mMkGV2V+K2ib+0fWRKS7t0V3/NXRVYkis9go78B1FeZA0
	 nLCJnGUUQaKb2EQtprlCf8fX/b/fN2+JPsetuLSefOE5oSAdBWUb5YCBFLkDeXqYKT84f
	 nHs2c+z8t83ShniQ6CNR3Wq8PA/nq1Ef34V+4g/T0BD6cE4fkEjL9UvnzoM+6TD3A8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvySfWxe;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25960606A32E
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 12:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25960606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvySfWxe
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1042367f8f.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 04:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795859; x=1794400659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=TvySfWxerwz+dWhRetETBFqzqumF0jAyeAC+LydLBBp/gqeqZaMXoxCiBfvTXTn13z
         yoVlaafMNT/vyGT/QEjCJ89zH9nNG5rVYWGFZv1rGI+0v4QS7+uOF0QOd/I4WZmGTsiy
         tdeSTsYkkak67evWJjmBGRN9YG8CAEni6vSle5comB2ZizaSoU9LTuXC8LDvPoyWgfTV
         E9hoEsfD9kSISankKZuI8mqAV7HfDg4Ikhl1PEiHLnxPrbZmK4yUPrNCILmvH2CxQ7WI
         gwJz2RAEuVniNy8j4RSgseu3O34CIXDA4PERqFXZe6gLmjWSa40Jtm51qu47wpE99/nh
         wLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795859; x=1794400659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=HGNZaCJMhAvhmVsYP8MfhLWAJWIq0pXE6CiyH2wtRj7yzES8IY2us33mJZiu3ej1MM
         UFL/fr7rrkj9aHLlH7BceqTjNuk5uzem1ez2CEjcT5p0X3x5NJ9w99LyFONMBpwcMMjA
         8BExn2ivVnlKJPHAkt1sFIcU5lO7M7Q6OdxerfbgaGy2Aka1wefFvMMEG+d80SUCs0Dk
         EWD/Ad3y4E0QNxAX4JE+lhpM/HdSGs8eK+wlLsUoOIOTNaVxsl58WuBDqDwL5bj2gxo7
         Wxh+ZHFn1kp5EepejBzOAhcPTzsiqIUR4s+SVkFG+GSt+4dTvunYTRCdR8swXbH+hO6r
         h4IA==
X-Gm-Message-State: APuU4Z/HEXtDzXvsU6SgcT0zyX//n9EJ6YkK1J07o49U73iKvdBg7/SL
	alq5KK0NPUMb8VVgk0L+qFaerqa/6rrl0FGwA+eXXBCuh550BKBU0Z3Q
X-Gm-Gg: AYBFou0PnVS/mNJIZrDPQ6m4POvVemDle4yptP9IqH62fwG9ut01jhARq1Glnnnxp9T
	7xZ3GlEk7CGnKQR/YZoAev5oGWST2go94BKyVT2dZUkT6gUrilpwszp97moNk2/rMTfBa80gJoo
	SLTk3ckWaZu968pJEWpFX2CXGq6ImytBhabGV9wyPyhB+01BYWJY71vMd8E4I9HtY8ZMpzAOJ3G
	mGlibunDKnvgCFx2WXgYkn/IpmL1KAlVtAN0sgBduWdOpEv0MYlzmNXALZPZKdsbrEqh8XcUvAU
	o13u/XCdRrGo3pbf2onJS8QCSjbmlSgMdAhphi5cyjF5xeeTxOPWvt7DSCAFcsk5Y62VCFEs09B
	Eol0/b8vh1U/TFKcrCINgGK+HHx1ZjQt7haH+eWEJ48cOavtVDBUvbaRGIEvqq2MaAAOyjIuIW+
	U1gmtbL8U+HFszXum7lCBlKsvSOAsr30UG3ujq5IOtjF6UZajt/55gsddVHMhCKS2t1EpJQ1d8g
	XTlh42Oo5x2qAI5I+GrqGt+MnPnsBJjh/UQqbyziWVdM8F/XHIJ37ie18mtpfD4TNLxpdoRUz9c
	bb8aPEkvWuDImHOMHv5O5P5W/b1APY1053W6UTcX2wtJOwSQIg==
X-Received: by 2002:a05:6000:1843:b0:48f:c595:d51 with SMTP id ffacd0b85a97d-48fc5950db8mr5312034f8f.14.1793795859436;
        Wed, 04 Nov 2026 04:37:39 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Wed,  4 Nov 2026 14:37:14 +0200
Message-ID: <20261104123714.234634-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 6b1040c65373f..657ccbb9a9dc5 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -308,6 +309,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 73b6d06858cff..896f39e345379 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -105,6 +105,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 #define AAT2870_LDO(ids, match, vsel, vmask) {		\
 	.name = #ids,					\
 	.of_match = (match),				\
+	.supply_name = "in-ldo",			\
 	.id = AAT2870_ID_##ids,				\
 	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 	.volt_table = aat2870_ldo_voltages,		\
-- 
2.53.0

