Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100790;
	b=X/NOeSMoDZG/8uDDuif6o7F10nFKKZBp53LyhKGnil3Wn1Mv/01PPRNvuT2yJ7TVctQO
	 9AvhhghYK5Q/frGcmPohU8q3y/SM2P0yVIjneRxzpwsjljCJ9VN4vNERFhLRJP1JgKJFB
	 V95mV2VHD0GhuPHu71MjHRZw1FTZCFkVWnqYqFnE9SOlA6dVTd8BLDXxd7B/D95f3XYQl
	 JywuyQSmFAADdPGv3BK2qiHS7DDP8ChZ9NNAMAkPjYA7QNXvBa+2weloGc1crAp3Ph/yf
	 ojAc7sfQwrHifCu/QMXXDQ7ntFMpx0r3oANKDlgYd++2tvW0QJTO5C1UPR3HdITlR6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
	b=E1GO2mBGMaXSZ4RO8bYunw6KF3/N5hUeoA0J2pCaNJdXoXJLbBp34bEJlXhrPJ/9JS2v
	 j+/CPnRa76eZIs91XFmz36Dxl/goPBGU9sOSb/ToPbUhmKRT5l9EY/nLEb3vJZCPRE9uO
	 X755SavqvjhQw7BrhHW3Y+FjOOTSHF4IE77001EKqGIm7f6uytmcYHcUSM1F+1pcI3+zr
	 B9hBOuftckOtIy+QfTuKDPojkfbJ4OzPORAzJ7NQuUtnmXtsacVWiSI/zkUuj1jWElZqQ
	 UtmFzQWTnjoOETQ78IeZqeGWfLS0YXM/syvvb09WBebfZm8L3o8xZCzieVL3Tdb+gOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00060A3839
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F00060A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c418e215671so514656466b.0
        for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100779; x=1793705579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=FysbPPrl9egILZFnpaxPn0Dc65tbxh1CZJ81fu2H8XpNxGeN25sllD4wx+hX87H8OP
         0MfAMCr5e3RSZo2UvGvDtleAKoNkQeAzWPL+Aj9bbK7MgpNAC3vO5pgr/LcDb/EqUu6r
         hSB23AHtxKJImR+2G/y9WE1rOlPiE/4nUOLN51UCzPFPhbYlbh4aXcTgnSAKQ2US1/RN
         Q/Tgy6m4iLSNbLWOCCG714HDnmzYHmh4e4Os6NZYwaaGdvWcTdNoBsIgrHJK2Ka1uopL
         EdAjvZtITVYPop+c4b4f93tJMwv+l3bJgR51VcWOf8K2k28zZJw6LtLKOuxcfrZOjFwE
         5zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100779; x=1793705579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=AbIj9tKBJFXQPISE2hxr+tN5Xd0G272JLRiXVeXh/AOrswNxeMkSmoFyUNGR9spvQY
         yAcEzWoFphuFrG6WZ/PyWl868LD80wHo0uDgFF0e7oORZrP6r0fT2B6sN9SZI8daCl5y
         SKF+DxrwzWHLJs5jBKcADixM9xjDTQdVQKEh8EZNg7a/f8x1lF3MNpao60LbLyDveF7E
         JM4QJHflE6OQXdIHgmzXxzAoJ8l/daqpEWf7HgqGvqr0OvJn8C9JWLOnHNxboypqYdTG
         S8FCCceCT1S+YtVAwFr708KiqVkxfbQsVxYnoeGoXkNGMWoLorkb0FL6Bx7fBUeW7j84
         HhTw==
X-Gm-Message-State: AFq9FYK9kHSNIL5OgATUsEDef9IVyIUBeNSbTuIxCiMqBFLh/aczaCKD
	rYuRkiRYL1UzdeWU4TWjARI/Xp+3Tk47mD7lFtVgsS4uFukmp8okVIFp
X-Gm-Gg: AYBFou12farAiALdvnXrpv+9t4i1nbZ+MGrHzt7z3r1yF3MNk6r8XBm2Yg3u1CGluG7
	SQFLDLSHXsAuUtqr2OXTW0Tptc5GCXZqsjIts+23bIDYjuOrdSPKqdKeargvotPkX3SE652eG13
	N8Bw4qM7Pc8qajGi5rMl1qIfzCxTOfyPuc+IwiINrxcJyHDZUWg2f2xT3BSDos4RHb7DXMj6tJJ
	qeDwCpoSD7f0D5is0Du+LTkKehxmx3JiQAA4Z3lahEeN17w5WI7RzPWDZEE0ODg5b7eaTlITBxk
	YYXMtObLTtbns85SjAfI02XRxI/o0ZyjqeeSbOMgeVi8VtHzJ0VltwA6LN/Ky6B/a8dR2ELdmXx
	z5DIH57v0YjhzsZgj7EsjMonicJeYb4FS2lz50vCa2uXloTyDYBlGM8ooG8csrpt1ijrgKTlmXT
	12KcwBhrNpf+rVtW1YNemq4OCgZbSuSlumUZfRTbuOd8z/rYBoABzEox3cwpOE+mdkiIdxxvRO5
	OXVsclNdHzY/jO0d0gEz4eaL6zwpapq4uWvi5bJqf+ehrFXqt1knJF/Lq4bRvkjOix6XkPvCoKM
X-Received: by 2002:a17:907:6092:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c46bde9a0eamr971176066b.44.1793100778881;
        Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
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
Subject: [PATCH v5 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Tue, 27 Oct 2026 13:32:30 +0200
Message-ID: <20261027113230.47538-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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

