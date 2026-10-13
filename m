Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D2553162E
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914997; cv=none; b=TvK9iF+jMaP8K3AaEr85prSTpecxGnujWRFldu0xy6wMvExBuE/djP+9aNZWlVsG4GuJ2TYxcQia1EVujL90CFaokzQaJ1/nR+dGrQbLiGAZh88SJ30XiU8NSaQ3Aq2EWkA/MlvQXRzd1awUz5nof6ZEBFfDdZyb3pdWy9pdv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914997; c=relaxed/simple;
	bh=wFz9qtE4/v6AkxRE3jysvHKfWx3fP77bQotrkPc2bDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYgKm+2yVx5tjzpyBymP1SmKgQD1MDhxCFcyaRWLd1UflXv/VcNNE41jRnnoeX8xy5dTalN9ObrCez8naY3NbKVpo1JchLPKSmxkjwZtDHKmxOBb9txr2BbNynjUH7Wl3gAw4OdpFd75MWHhiA3ySYqxBwXjy7zPybkjm44E9rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTko+gwQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTko+gwQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1754095e9.0
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914993; x=1792519793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIN9I4fxO+jG+4Tem3JpMlKcKCKDmfxcYWPCA9fO/20=;
        b=oTko+gwQNdA4Wb3V1oj25l8OPKlZc+LbKzo6GTPE2ACXDdqNAiiQp7q4rdbwIP5D4M
         o+VhdYFeU+zUIaNR7X6xpoydLCMhF4ng9j3Go06HRO8JGwCjexdAI3iJ0VxmoTja00VF
         UWnHarfN8XnZTtQv5CQyO0Cj9yv24XVcva11N7AG1QG5ttBCat67zm6fV0HE1fIZdrAQ
         PzTpLFStQmQt9cZ+TxQQIra3RST0eMu23j31uN0u044NFvfWB7L7kOQ4ZoY3auHmZbzS
         T9+5OvwSvyf6ruwYb1T51dC7GvmU5agu8SEySNCdv9YB6SWud/bMxe9l0LF722REK3rW
         8QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914993; x=1792519793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIN9I4fxO+jG+4Tem3JpMlKcKCKDmfxcYWPCA9fO/20=;
        b=zuWE0L3wFmu4wrZMYgYrDZHTbVs1b46OAWgfBKWYQ8LN8SNpqakQz7W7c6QFDxntp6
         Udq1jiEANOPFxDYq8AXJ6/wEg8uoq747WUV8Vy15yIPjWegn4aoKsWK1/AoekPVqzQTT
         vnKeLt6OL+Ow8oyLg82cDxt9Zek1nmg2jf9QeeMhaNQSk9YsKj1qYcUKyhwp36tPyukr
         ZbjbEJwdx/uoLK75ueeV0YxF6esc0FiMgGF3TJLKehHf5KckXZCwezb72yxU8yFn75W5
         xqQ0jT8iMLBsh2Se2DRFJo5Q9tmM9xr9sze3gX2QKRWHTzGXzTNJcxSKoH2e3IJnRTde
         GYuw==
X-Gm-Message-State: AFq9FYJ5xo1e/aJxpAiU5IZmhOXqKZGdPbgdUR+poRzn0jcJSbNSCzcG
	Qox3UnXUxr28a+uj896w44/hIAEDwVr6Mxun7Vqw3byl6aRnztPpvW3z
X-Gm-Gg: AYBFou3vqDJ4bppz0rhcVlJDrdaQ/2Rz+wh9kjxzVjzcl9gK36+QvMk4WmQIdwiSn4h
	+8JepM8fKXqDlZYscIARfPtNi0tLB+PAY1LFk8rb5o5DzDgxwn34kXD2Gg6eOEwe637uP3qiRPf
	ZEg11QZurNXOGBKhH0HJrhhNuQk5IIb+frELW6F+z9bF3v2mAN+EKTZdgh91wlv3yG5YFTlnyuB
	59i69XBh/SDhYYemZWAYAxWRhfzCsOQaey5lBzRbwuYlehn7KGwPGnN8RV5uLE1rMhvoWuIHi0n
	hH6GidiJ0uXuV4GBtfV3LklOs1IIaWOae4Jdhol9JDugW0gMKE4JOMW1KuFRwpZqtey934NyW5R
	xLv9KxwyiZTtw5HrDWt0DEtKTVaFbi/GcmD9JmNPOk6TqqSXdr1wFxkcjWWrkUYq4CSgyrLVPhb
	Q4+O0yqK1/00av53C3gE9tDEp/OnB5bihkRBlh53seoyIeskNCHf+SUMDOAcNEkauiudYTLDQU1
	pWbS/glqcp29DJhAXU=
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr296577985e9.17.1791914992608;
        Tue, 13 Oct 2026 11:09:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:52 -0700 (PDT)
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
Subject: [PATCH v3 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Tue, 13 Oct 2026 21:09:33 +0300
Message-ID: <20261013180933.487013-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
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
index 909c14ee60323..0bd430b90bc1b 100644
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
index 9b8eb8df220a7..6f19b19f694fd 100644
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

