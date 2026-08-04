Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7F52D1931;
	Tue,  4 Aug 2026 03:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812644; cv=none; b=Arjn8HEyl4nvd4zxxethxSCVmq5WvcgGNuB7q1Sm7fDBOp60rsoOmz844iKfHBw6Oc+d0EYkVf5M76Val2XsVxJjX+0nbxO3TxkZFXwn6uhNMKdYun5Q33kEXp9VbKbXhhUg4Zn+Ur6bAoe2faPDl6rKK43H6A9awigm86N9wnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812644; c=relaxed/simple;
	bh=fz025/z3UawH+L/V+CfEivqAFGOPAentcJSQIZkOe5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5VbMbt3lF/xp9U5A987wBWI3I7Dp2u11OkYymeUOF4FI0G5KS9Q/pokmS1+qiC8bBmsRFaNS2Q7AZvNa0FqcZku5Z0pyhAsMCDNvA1Q98xdJDbeZhTKyCvwFZGsWMb+eB7SGijlJhGIfpskoUu4578N2u/OTvVfAGmjcp2/0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3Tysb2X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3Tysb2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785812641; x=1817348641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fz025/z3UawH+L/V+CfEivqAFGOPAentcJSQIZkOe5c=;
  b=l3Tysb2XQkiUtJ0MjO3WbQZVjMa/8VNcW/ec/y3YwxpA/nCJwFB5i/qd
   vVslIUjNlZCG/SyioZrSXSMQ4M+jbMKyb0bndNGVQR1piS/YXfgT3rPDR
   4864G2JYNfTlc+MnHzAm5645SN/TFrKLD4JottANyyl4evCmwzT7uZAH+
   tju11QPVJWMofacVXSJjDz03cDTLj0ZNt02ensC3NHMWZzq/VOxuX39N6
   SIvsJa2VbMlef6PGDZlFOkZVu0fhAlbBHf/UwbP01PGCDO2aSRkev64bV
   dZYt0A7xPoqjUwk+38/0CCvNt74f7j4xwBPLX/wE9gnSg+KqZOcNriHSn
   w==;
X-CSE-ConnectionGUID: MTeYaEtRRNuPSpCKhG/Ejw==
X-CSE-MsgGUID: 4lbSNaloRdCjJlUHs8CGsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103759424"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="103759424"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 20:04:01 -0700
X-CSE-ConnectionGUID: biiYxiQrSOuk0toZxzRvuQ==
X-CSE-MsgGUID: I+i9IfBiR4y2t2qbP9+v8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="260139962"
Received: from junjie-desk-dev.bj.intel.com (HELO junjie-desk-dev.tail2c02c1.ts.net) ([10.238.152.71])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 20:03:58 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Junjie Cao <junjie.cao@linux.dev>
Subject: [PATCH v3 2/3] backlight: aw99706: Validate all DT property values consistently
Date: Tue,  4 Aug 2026 11:02:54 +0800
Message-ID: <20260804030255.1934470-3-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804030255.1934470-1-junjie.cao@intel.com>
References: <20260804030255.1934470-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Junjie Cao <junjie.cao@linux.dev>

The lookup helpers for dim-mode and ramp-ctl take a shortcut when
lookup_tbl is NULL: they accept any u32 value without range-checking
and return success unconditionally. Out-of-range values get silently
truncated by regmap_update_bits instead of triggering the dev_warn +
default-fallback path that the other properties use.

Add a field-width check for the NULL-table case so that values
exceeding the register field maximum are rejected the same way a
table-lookup miss is.

The switching frequency table has a second hole: reserved slots use 0
as their marker, so "awinic,sw-freq-hz = <0>" matches slot 0 and
programs a reserved encoding. Make the reserved marker U32_MAX and
skip such slots during lookup.

While here, also switch the error returns to -EINVAL for consistency.

Fixes: 147b38a5ad06 ("backlight: aw99706: Add support for Awinic AW99706 backlight")
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
 drivers/video/backlight/aw99706.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
index e130f164303a..6ec49b6cb14c 100644
--- a/drivers/video/backlight/aw99706.c
+++ b/drivers/video/backlight/aw99706.c
@@ -60,7 +60,7 @@
 #define AW99706_MTPLDOSEL_REG			0x1E
 #define AW99706_MTPRUN_REG			0x1F
 
-#define RESV	0
+#define RESV	U32_MAX
 
 /* Boost switching frequency table, in Hz */
 static const u32 aw99706_sw_freq_tbl[] = {
@@ -94,17 +94,19 @@ static int aw99706_dt_property_lookup(const struct aw99706_dt_prop *prop,
 	int i;
 
 	if (!prop->lookup_tbl) {
+		if (dt_val > (prop->mask >> __ffs(prop->mask)))
+			return -EINVAL;
 		*val = dt_val;
 		return 0;
 	}
 
 	for (i = 0; i < prop->tbl_size; i++)
-		if (prop->lookup_tbl[i] == dt_val)
+		if (prop->lookup_tbl[i] != RESV && prop->lookup_tbl[i] == dt_val)
 			break;
 
 	*val = i;
 
-	return i == prop->tbl_size ? -1 : 0;
+	return i == prop->tbl_size ? -EINVAL : 0;
 }
 
 #define MIN_ILED_MAX	5000
@@ -116,11 +118,14 @@ aw99706_dt_property_iled_max_convert(const struct aw99706_dt_prop *prop,
 				     u32 dt_val, u8 *val)
 {
 	if (dt_val > MAX_ILED_MAX || dt_val < MIN_ILED_MAX)
-		return -1;
+		return -EINVAL;
+
+	if ((dt_val - MIN_ILED_MAX) % STEP_ILED_MAX)
+		return -EINVAL;
 
 	*val = (dt_val - MIN_ILED_MAX) / STEP_ILED_MAX;
 
-	return (dt_val - MIN_ILED_MAX) % STEP_ILED_MAX;
+	return 0;
 }
 
 static const struct aw99706_dt_prop aw99706_dt_props[] = {
-- 
2.43.0

