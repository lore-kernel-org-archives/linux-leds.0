Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9889457E66
	for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752537; cv=none; b=nr1RtCPsKDQCxmRs3lFDe/zY5eJypV88EDLA29UrA8wioV+pnciuPzmaF5YLr9vzUZAPUT+wU4tCBjltQVtcqvO0qu2uAFiIPvBb6RgT08Rrcp7lO3hI8B7bnua0QGRzk5lPZWB8JtC07Xkp+w7Nu5c1CB131lWAu71yvzEdrGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752537; c=relaxed/simple;
	bh=Uv8673BXW487YhAql7BVA6vApReuaTTxPWI2C9lkqJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVVq3zTzs6K9oyvKCPeJUpGQ6jCvZJ0ONp+u7m7Nd1ojm9U5IzH51HFrlDoyUaxyAdQ8+BI3PUvb70A0H/pT/ghKkcTIq66511PWd3Rgkcj2/JXluJdAJ3ATqx0W5nYmTYKb0zovRGVBbT3PH2u+ioH1p7CRbSyD8VDT6snJrJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3FUjCVQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3FUjCVQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso46419495e9.3
        for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 00:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752528; x=1791357328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91UgRJj2a9cqCekJgIMfhdUvCOQ/1gwR4pNIdWvIxRc=;
        b=Q3FUjCVQwjaQ2UWSq/dqprUKHjBk7iUytEtWe6w+YKxMgWGK8bOuvneYGaO3+o1Qz2
         upsOVsiFJ327T/spzqJr10EzSlYSpYJ/KI0NVvCpXA0PKGbMS/LiLqtFWLCLmcHr3WtR
         pJiWfNUzILK/ZiJvheecXSw0Yf8gsnTLD9dI0TIvr655oFFqaZKMsutHzv1dnVqx38WQ
         tvtBHX1ETpMCjDc8i/y1+y+byVpnUeGVmDv8v0PmrdOLr+w/cWFn5MGzW8VZceloXHlg
         GVtFJWUjRCf2I3s/8SD7ojpSX6+LY98zEQtCGnsVm9tuBu7v9+6PBx7mSGuz+thrJWDE
         6fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752528; x=1791357328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91UgRJj2a9cqCekJgIMfhdUvCOQ/1gwR4pNIdWvIxRc=;
        b=CEnTzll6j1RKTUldkNBYw19ZTyFWX/LShdPpPfc9NYiR6fp/YivWAelN2FS+LYxujD
         Q84xcsXSzMleT0HTQpg6h+RmveD2F01fbwaEecOwYREzhTU04r1/PL7Trupesq7bUJ86
         wvNAV/mUgWhlw4MSF3SVBf/lfh7hF4XUC0EVl2bBpTV8JQ0a8X4crTjjRVWja0TMmYJF
         p5aALSlWKj5llgDm1ywQS+aa6HsJWmFqy316bS4+vPpb4CobfG/hdFcA56Z2mkSgELCa
         H23EdHkZY+Ihebo+zJ3owU471pROSIK6y4CqLphYnIlLqJDmYjxCiNviEhWMdXYxQDtT
         G3/w==
X-Gm-Message-State: AFuF++kZuaQz7zM2UmhAhSpIuq0myEJebNna/kYeEoLP1jN5J4qta9s2
	Cnhm0FCmjlxACHa5K+kFsO9X1e23umRikLGByBcWMA8zcchkyTNEs0R+
X-Gm-Gg: AYBFou2YN+mBRKbVW1tG8Mb3S87m8jsj1P6I/pcVXfyu90kbp5FwLArLZYGP2NCiW0/
	Ynji6tx4heFsSTDqCAbiyeRTruqh4Ecgu1y3CD3AVL1lTmd0sOfT6CQIpK1+VhPY8vIdgdV/O2u
	Oitda+p4FqmGhOQcuEDfj+6p+FpkAJ3D6cCNVJhNNwmrkqWMZ6L2CynuC+FBGj4xANEELPVDB76
	9VB3ADwTv1TkpA0b2a5i7+Kw5DFs1qJsE5y90o/NeQOJ91XcTeRidw+K/Ye+8sNSzeM876VWEgu
	iH6heC995gv6sLb9bsC7NChxSOhVlQNpEzkPAyV5PhQVhLfrzOjbw5j4PA0jStHUD/AEiRZfurN
	r5Vd8hUU5XUq8pyiIlIdyfq8edkDmTrGHEUevFjbBZbceljwPV4rKFvFI36kTgGpAgzY93AreQ+
	g6zDLIiBD8aiF2AcArl1Akn9PY/mnz/CJBZW4reWNPamcW4bn50s8Zy5Y/cb6/iyZQ0IggbiWsF
	PmWNf97ek+FISxHLo0=
X-Received: by 2002:a05:600c:3b1a:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-4a01b12b310mr5780705e9.29.1790752528575;
        Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
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
Subject: [PATCH v1 3/3] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Wed, 30 Sep 2026 10:15:13 +0300
Message-ID: <20260930071513.54697-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930071513.54697-1-clamor95@gmail.com>
References: <20260930071513.54697-1-clamor95@gmail.com>
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
index 8f6d7956e79b2..a9a11be373916 100644
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
index 4d399d0486d19..4cbcb277ff20d 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -114,6 +114,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 	{						\
 		.desc = {				\
 			.name = #ids,			\
+			.supply_name = "in-ldo",	\
 			.id = AAT2870_ID_##ids,		\
 			.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 			.volt_table = aat2870_ldo_voltages, \
-- 
2.53.0

