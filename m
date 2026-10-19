Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A54D7D2A
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404591; cv=none; b=Zal52rYW9VOknbbmabzrQfNtYkvjjHXBygHDm/dUNNecCsnpRlMLBwQp/wB6l3yxkfX/jD+ikpOAqZ7bNLHr0tJWEnUuTLUj0QIry3U/zCd2qpNGAPpUiX57aUjp3QTf6hQD1wFnb6lfFV7CMrnxVK5PxlLRulL4DuON+R8/UGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404591; c=relaxed/simple;
	bh=dE+CLRTmP2biIMs5iXmOIJYZyHULbF2+dSHPt4eaWFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUby/dRw46GLRWdhdWusPBIwi3VqKNOYEUC1lnrvtPT9B2JdSpK+RTDn17/ReYehePivd5fOlLLuipdxFZ34C5inqnlJyYKw3B/7Q2wf3QRZfqxWGd+MqccezkIPz+zrPfjFjrThnlQ1JrML+cZgWLtO44PkxrX/EPh8feZecLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6qji9U3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6qji9U3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso20125015e9.2
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404588; x=1793009388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOBCTDJ4Zly3dd28/nrymNa+BhMmBCq2pAK/siAAt/A=;
        b=Y6qji9U3pfynSD73L35J7XBpx1K3GqRFlOkvsHy/FFdsFLcUzF+XHmL+uR1sGHViRq
         2mmTUyxpsLVUIcUktGAPiUICDroXdIo5g1XaSCmvLEAI+sYh6Wx35r9fATc9XZcNCSsB
         ySFRxmt1wnxglvvZ97tdt1A7oqXJlIv3fhIFeOLNRwJK0A8dn9ziBilxLVQeqAWmT+Of
         hvtgXbWufjNO828S8TJ5zgPeNkH851rvsHNFeSGR4N6VT+4HJWamrbZ+WJwpX4bELCfL
         yS0iaM5J7DeGnaAUycvMskhHRJBR7+8NVD/NV76sX3Irbtzal0i1lmRWyG2J3kGmZceF
         i9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404588; x=1793009388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOBCTDJ4Zly3dd28/nrymNa+BhMmBCq2pAK/siAAt/A=;
        b=PDOdqLrccAr5Y25oUXtiiBhzch/yAF4aA6V4QGks3KYKfsWREbAHmWGL6+b1hjts4n
         UHkitJ/RRiyN7bNz8DOmjqdHhWpul2c2CYvc92la7LUXb335wi+lvqhiOmWRQN5aZXs1
         NJ7bfVR4zf3ZLWYmpsuwXwIe8UktKP0XNPnGOY8Gj6Hj6jGqKeEgzx0DX8LY3knOlfGU
         lOM6GDXtKKrr8TphmDnLhX8Kq38jCMkVlJXWEeeqS2ftaIeeB8EPPS4Vu/31Tv7kXSee
         ybjK0KQGBCnVj7McdIpWtjGmfWaBTR0KPhdDULr7+hyV7UlkblTNIu1JYW2S1OXDCPXF
         PiFw==
X-Gm-Message-State: AFq9FYLd73364FI0/9jF1hOpbnRvcyQQrI23kF4Y03kvzGGto3j0J1Mg
	W4iduMJMGWYGtXi7j/k8LKrC8mbxvGj7laAfLMijQm85zMNO3Z9ss1Su
X-Gm-Gg: AYBFou3nFBkR62o/LpAEIqqo5ZcqySpb8zx9AkepH4W8vDEuHrrWZGn6lvdEGDhyqPA
	54TMd6yj4BLI6+qYQRqGtpJqT1oYOSLslrQDRM+Ni5yqBQHmUkZMwtrzUHHxk6/bm0JyZXbM/ZD
	UNiVIw2E2NSZY9xtA2Q42p/QY01H+YntLt1Er39i878CwFeC/xWgt7GGcdAlokFrZlSuDZCKprD
	tdCLXmTf3XabDReCGmuDrtcok3ZQq+kr6MwToJwMYO27OgUALkc5/+3vp/4q7uznbYf8PlW0YvP
	OiDrchU6liLkD0qxYzjeEhz0LYCroE4/5PkMSumVqDxyiRq71Xh5UP2IrvcRGbxUJskWX1f+J0g
	RJDu3JuDhqyuQgILKuod22+v96oyL3ogV7FklgVTNZ3aTBJDeZyjwOgRtnaEi+NhRRIwAI9w1T8
	Ucvz6BuFAbkr0UE8CmiIh8NPiW3BqbgNU3PhRLDJIZTKx3Bbaq7W6dVt2vv0sXhqqOLWKPNY4dy
	QPIvXbYjF/FEKpL0wNJfgo253cO5Q==
X-Received: by 2002:a05:600c:3e0a:b0:4a1:ef9d:1b68 with SMTP id 5b1f17b1804b1-4a1ef9d1bcemr8412035e9.10.1792404587670;
        Mon, 19 Oct 2026 03:09:47 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:46 -0700 (PDT)
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
Subject: [PATCH v4 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Mon, 19 Oct 2026 13:09:30 +0300
Message-ID: <20261019100930.110954-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
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
index fe43ef675f257..0284c5fa8fb54 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 
 struct aat2870_register {
@@ -309,6 +310,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
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

