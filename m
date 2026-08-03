Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191B028D831
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 04:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817049; cv=none; b=YWjSzxXVvfCdU6/dY6UOl9FjNplbUy6D1NzAATrrz1F3u3xyeZO+5q9C7Ce/pJqjIybvz4n1Vk+/l3bR6pPgXIHcBk+7uHcPlk8invW3qvPJ21lyCWrb6j5hhn5Ha/Jipyk8NN4ohTvCH4xNExBpi2VM0Iz6wLn3fgm7aTUWiWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817049; c=relaxed/simple;
	bh=nlCIUQdeomCvgK3j8vFmsSg/UUT/LjoK0D9KoWguSlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+WlzQwE8NQhqhUrAZLh0Vm9/iwSPv4R2k5MWQAUTL3dFjNBiKQ0C5M0tSJ87jrJybjzTnPh4+kkjYMU9GG46AF7fN858dQDvId8IsPZZ/IYhLzj7x7XNvRunQStaSNffe5UFq68+coISUWMrlGB1zMa5a45zYBi1RSfMpp23cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YLQoZPah; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YLQoZPah"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785766406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fLmFQghAKB0YhK4oz6/TkcbAFVqh6AWJi8TPUgEXZYs=;
	b=YLQoZPahNWx4mziCtiNuqWhmrNHNA8rV/3Y4HKIvbnwwhL0eKzpXM50HDwERpFQEx7o1DK
	s4hr7PZesKBZjh33MbKCjlj7vAxsuMOPkinG6SoweypPvtJTXxngfilV/Mm9yxHzmizDWp
	AiKo9VSj3HA5ftIPabefUbmeQdFf8UY=
From: Junjie Cao <junjie.cao@linux.dev>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 1/3] backlight: aw99706: Fix DT property names to match binding
Date: Mon,  3 Aug 2026 07:13:08 -0700
Message-ID: <20260803141310.1379194-2-junjie.cao@linux.dev>
In-Reply-To: <20260803141310.1379194-1-junjie.cao@linux.dev>
References: <20260803141310.1379194-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The driver reads four tuning properties without the unit suffixes that
the binding mandates: "awinic,sw-freq" instead of "awinic,sw-freq-hz",
"awinic,sw-ilmt" instead of "awinic,sw-ilmt-microamp", "awinic,iled-max"
instead of "awinic,iled-max-microamp", and "awinic,uvlo-thres" instead
of "awinic,uvlo-thres-microvolt".

As a result, device_property_read_u32() never finds these properties in
a binding-conformant device tree and silently falls back to the compiled-in
defaults for switching frequency, switching current limit, max LED current,
and UVLO threshold.

Fix by aligning the property name strings in aw99706_dt_props[] with the
binding. No value/range changes are needed since both sides already use
the same units and enumerations.

Fixes: 147b38a5ad06 ("backlight: aw99706: Add support for Awinic AW99706 backlight")
Cc: stable@vger.kernel.org
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
 drivers/video/backlight/aw99706.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
index 18299faf06ad..e130f164303a 100644
--- a/drivers/video/backlight/aw99706.c
+++ b/drivers/video/backlight/aw99706.c
@@ -130,23 +130,23 @@ static const struct aw99706_dt_prop aw99706_dt_props[] = {
 		AW99706_CFG0_REG, AW99706_DIM_MODE_MASK, 1,
 	},
 	{
-		"awinic,sw-freq", aw99706_dt_property_lookup,
+		"awinic,sw-freq-hz", aw99706_dt_property_lookup,
 		aw99706_sw_freq_tbl, ARRAY_SIZE(aw99706_sw_freq_tbl),
 		AW99706_CFG1_REG, AW99706_SW_FREQ_MASK, 750000,
 	},
 	{
-		"awinic,sw-ilmt", aw99706_dt_property_lookup,
+		"awinic,sw-ilmt-microamp", aw99706_dt_property_lookup,
 		aw99706_sw_ilmt_tbl, ARRAY_SIZE(aw99706_sw_ilmt_tbl),
 		AW99706_CFG1_REG, AW99706_SW_ILMT_MASK, 3000000,
 	},
 	{
-		"awinic,iled-max", aw99706_dt_property_iled_max_convert,
+		"awinic,iled-max-microamp", aw99706_dt_property_iled_max_convert,
 		NULL, 0,
 		AW99706_CFG2_REG, AW99706_ILED_MAX_MASK, 20000,
 
 	},
 	{
-		"awinic,uvlo-thres", aw99706_dt_property_lookup,
+		"awinic,uvlo-thres-microvolt", aw99706_dt_property_lookup,
 		aw99706_ulvo_thres_tbl, ARRAY_SIZE(aw99706_ulvo_thres_tbl),
 		AW99706_CFG2_REG, AW99706_UVLOSEL_MASK, 2200000,
 	},
-- 
2.43.0

