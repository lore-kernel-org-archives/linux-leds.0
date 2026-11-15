Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733126;
	b=5kDbf4N3PewaGh3FMV1Jp8wKfORZi6xbX/3LiQ5/D2w8vtuR05BJ5OIDK0T3Yjuc4VnG
	 zaT+A/Z5ZZ2hmC7L4mmuXGCEFyToTeCSIILvQMzCJEQvuQO3JOtw4qWVfdW4cuWX7yJ2e
	 q2m8pgfMaAosCqOSFMjyt52z3L9uvIpoccpz8dZ6zlkc9jx5Qy/aiZAdrD6oYhFbKwbFG
	 4oq9HnMnGkNE4+MdRyZxtFFvTgDJGrVlw1LNjF66M3kmvjqS7UY2nFxC8Woslsl7wZmwx
	 /zfpuSQmF8frbnWOqRcfV10bvTcDpED90zh9fgBwuxvRbMhT5jKN0XouUgDxhUawCrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
	b=PFgyYSD5kjvImseI+Yn0QZmGZ5e6ie4yWD3x6+Z1ETg8z4rVDfplnuQIk8yKo10kixKf
	 Vi5gN34yGtndhSu+/LLXcQ1I1Yqzc3Dwn2p0ekA2u++roiiu4Ss7hFRiwmsNYBkIBEThu
	 HMSjqgsTUF77yfNmsSiC2ABrkb26G/uwXwM7SOmt7Lp6l2VOfYiVTfGIumpXmQx8DqSz0
	 iDFCHpkC/izVjuk/KOW87u9AKjKNJmQ4GZmGROWo9BF5EcUT0R5Hd8SlfNSYf0ZcO9/d0
	 JM702UNiRVKy6ayEL+ljebSwJOUXCIImgW6WZEzn3I8Zfh2scUPSrzM/ndnzpPn+zrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyceJaFL;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417C3606A898
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417C3606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyceJaFL
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so4085377a12.1
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733125; x=1795337925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
        b=IyceJaFL1RD5Uj2cIYVkpqUJGYpAsQmAs62+dHkJSyi1OeJRjqJV5iWG8HiRIEvz6+
         v5bG7Tc3+GvJfr5w7o9rrzpV/rP+kCSDWiQLTz0uL/yh0n9UJ0cDcqT4+1mMHh6BH3TU
         tjBwUBiKEAkPZMNOXDM+/DrtE487igK2CgmXQ1by5XPLosztCslliB4+2MfTUt0TiVH+
         KDpQMayiU84XyR8THqFWcLn0ogiBtJoiX1HGHBFaOm5Dg4EnXHWYhCzhSiT59U1edPB2
         HKuVttmS3CGSoBUYcdz9icL5De7Rx8yMBwVwS0r2hvKsPk2y0d3E3HZHNXbZt9ZiVx7s
         H/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733125; x=1795337925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
        b=Coqzu4Aqw/Xag6SNsTuB7iNUu/ySQKp/HxFs/T/lAiMBSuNVh2bOhnr5pApk6QrNIu
         0OrwHYKbt8+BdqwpfomAHoWLLDPJ+KN7QNDK5+8idNkhNWOOOXo3aO7Prq9gRkQSgZUQ
         ilOI0W+DSvEh20DpNVrqb2i+L3WgfV+Sitn2x5DZ2qy7evze4oLhmGGz8PfYvZ3Cuj2x
         AyBuGQmdp7aBZzwhH1iS3r+k0z3Mas4bFVLR8NKTC3BLPzkw8ZTfMrAjZIcucmIANXud
         bBScwhFh5K59TsJlh9Keva44WotynoX4WJ3cIUd15o3Iw4PWn+YvGSYjeetC4MFnW/BO
         w30g==
X-Gm-Message-State: APuU4Z+662e5B3r+9h1YmqxG276XGLUvpefRn1PtsX2R/mvRczoc763e
	w0lL6eapFiYo9ICuHtATLQjwXjtDI+Jc892G3GqlcVb3NKPx68RjA12a
X-Gm-Gg: AYBFou2PhfJW9CXJhvdbqzjIUYHcTZb3E+xtBD9q3iUnteGM/D8HPRberZZG2SAtS93
	X3uS9aOmPS6r4BmxEiwtiTBWVhU14SZBePrVu/A4ntdMZRKJjMPEZmbBMYwLwzeAIkC2K+XAcdH
	XG9mIFRi/XNxeKDgZtxf13fWqQq4qDA2I304Roq6ogLDilWIEDFWnkU9AhXKHR+W8vrGXWqfc3A
	D0qdEXmwlBq6/tMrGOr4i3OUbx2iplpcJHRIEXRStNKBn0xiR2zRVLjLzAX7ZcQKKRCNGGKr6Fd
	I6uyE6YZaQQWoql4gcsZlUEpKT5lZtqzjklLmSgLzofd4D85/nYkuWGxFVxkoKjWJ0wR0QwYQKj
	OtAkdSnNVsZseMbLgvd3T7LtiEBXN+UuNXEHsWbCLRgEItQG4ld7+p1jAOPGLpVu4oJ3Tz27otY
	LTSq3G2iygCiaqL/PC7hCJB8K0i5JhNwHzxAD9DuTtraVro88FQLRNQIM4dUwbsGbGQupPDJiw7
	daGib9W5OAcH9IbQWW1SrWLpEJSkWd9l175gCUUBctrTR9uwRqcm+KC1geg7NS9w/Fb82/hLwrD
	7t+4MQnrzPdAEyZUkzJqWWWbPG2n5VSooLq47EGTszeClM0kQV2cHV8EQuBUHxPQCsfp1KcLRVq
	VZfGHwm9oXA==
X-Received: by 2002:a17:907:5cb:b0:c50:95b7:d189 with SMTP id a640c23a62f3a-c5095dd72f4mr610171066b.0.1794733124625;
        Sun, 15 Nov 2026 00:58:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Sun, 15 Nov 2026 10:58:25 +0200
Message-ID: <20261115085826.89641-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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
index f5409dd91efb3..9017960ee73b1 100644
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
@@ -307,6 +308,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
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

