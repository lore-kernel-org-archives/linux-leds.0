Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86332FA18
	for <linux-leds@vger.kernel.org>; Sat, 17 Oct 2026 00:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792197835; cv=none; b=ZqHCwoKrCIdodhmIRWPMHIdVVRHo+aHqQJvTzUArhUuAaP8aAP5zb8jpTpnMYaBnBMZCl76fBLpRiTR2byrYhOv3yeFCE9TULxAoodeJihMJdXiUXq7YNIMh0iNr68X/XRHjJr2RIUNT1m5xSxx5dgMr1+pCNMVGPU1nZUQBQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792197835; c=relaxed/simple;
	bh=9CYyxdKiea9cIJBb4uW5ZaZk1cAxoDLhLp9NcSk3vjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nw/RMZ3XuP+S3vZRs0xIG4m2u73oBU0zDptlr1jAt3Bq/d7aonKhDX7JXAxsRW58z83sX+qE0DllWJcj579XwetIi1luvGXGsFeSmN3wl2qnSeWt5tUuUWB7w77/aViGtF2uZp6bsXLf6nQMv9vsSRZqj+BVr7L6GB36mwHhfhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efUldbpy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efUldbpy"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so329363a91.2
        for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 17:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792197833; x=1792802633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfqAGEi4HNPjbODP9gI1R8fCber+6x+PZxAwNZvslrY=;
        b=efUldbpyHHDdz98Tl8FBa4JrC0ETNJHncd7czCCfub3A+7w2XclBXV1acdmZx7Z7gr
         C5pelk8cE6LHckNfHhdgJZLkb2Fsgdkc9KEUIQ+I1ZaX5GWjr5Ixye1M9kqH19vWlJbF
         aMrC1ra7V90ddoIcstPqRSkssN6smRCd69cyy9ouxoyWBefGV8xJESPeyrmhM68O4+NN
         i23jj/CAhVkGQWK5H2rt80FeRS2kTYKznB4/7I4PfMolSOvXGK2CYOmIgiyCGMilrV/+
         JNk3N4Y4DgY1Q+txRi4hIYThRYyHezxmWMpQS+2jh5yW53RPhIs8VWGbrolNrvsMqfXI
         MDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792197833; x=1792802633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfqAGEi4HNPjbODP9gI1R8fCber+6x+PZxAwNZvslrY=;
        b=hnKtJv4TmE+8R0M5f+Cb4ciOYp1AJ9P/YlnCCi8HQCPewU7EaAKNBW71LCm2212JP/
         9T0iGxOd/LzQdwCSmDki0yKSW2RRqfP1P3tJH4/lmsHv9v7s3Ewzi52jeN1/5WwudMN0
         k7BAp5ZaWm7pO9xTT9TMWqPHdQWSGmTyXh70YTtBv6nA/bS7P96ORbvuLaF1+7uaMiKQ
         WS89lLr73tVRPTxZIaF7JPAyBCRMguix9frIedoz1Vcp2NVNdkHcby/DzHQYhbEcqZ7E
         X3rfkHByERrRt1A11o76CbxUi55nn3P8inVGY3KRqLKY2shVsD/LF6YNtTWejJZPTsjr
         /PQA==
X-Gm-Message-State: AFq9FYKV9/DNgjJUR9k/4mas5zeaCutSeoGCXvi5DRFvt1YBuZ1TTk3U
	g5xRFskm19abg0PlIFKfkC07YhPwKDtMwO8oAjo3hRMmSk4KqnNslicHViHxrQ==
X-Gm-Gg: AYBFou00Bc/Zf9nSX8mGS5cCYI+Xq/X0pOPIze44AqbMbqlmODUduUOlU+Ehxyyxc8w
	USuvprdQQpl/QZOkDjU50yYQe14z5/ZpczgF17FnvDhru5FBK6ya+OqGrb0xvsdLtg0P1hB594G
	ag7oR0Jha/Ckj0dM335qDAWZe1C+jXcurPq99HWryucJZpxi4lv1PeRDT67x0eQcKjEUo3ESNJx
	5q5PaMIB38O9kf7kVzK1/ANxRT8efTdBUlTNeJnF8diE9hljsx6oZ3G4ejoYDMbZrHDxBhDTvL0
	rdYQ4WU6qUl41SI/NnapwFWgKS+fdFhTGrOgDl/ZBHw9Dior9fBPpuU7cwUt17+9eiHFjW0eNlF
	w1cowKGLpNigpIwia1kAc7xu07tHyQtlFOJhtGhX/K3fTBZGC2M+uv5tNy2BWHedc+jwzKzvwaQ
	dk1FCwE1qWasBUoCO7ELh8ouA/PD0nl3Ndf19nIRNnYPYBnj4GgStD+xJcvsSgqLwtmwOFEbuAx
	dz8EzuT91rsE/nSQlsAT4DO/qQt3ovy8wP3P7JHNVAmjZMOjOMiFRzVDT5yXvvPzIIAZlJUTzil
	yn3IUZXooaZ3cVC7gevCYe89UAxRS5hIE5Lv24mZDcPQNbhVeT0wllKuysw=
X-Received: by 2002:a17:90b:5864:b0:3ac:80dc:f40b with SMTP id 98e67ed59e1d1-3acef15450bmr1236072a91.33.1792197833331;
        Fri, 16 Oct 2026 17:43:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947d2706sm11191843a91.16.2026.10.16.17.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:43:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] leds: is31fl32xx: Fix NULL pointer dereference when binding via I2C ID table
Date: Fri, 16 Oct 2026 17:43:51 -0700
Message-ID: <20261017004351.1249547-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device binds via the I2C ID table (e.g. sysfs new_device, a
software node, or a firmware node without a matching compatible),
device_get_match_data() in is31fl32xx_probe() returns NULL, since only
the OF match table carries the chip definition. is31fl32xx_parse_dt()
then dereferences cdef->output_frequency_setting_reg and
is31fl32xx_parse_child_dt() dereferences cdef->channels, causing a
kernel oops.

Populate .driver_data in is31fl32xx_id with the same chip definitions
as the OF table and use i2c_get_match_data(), which falls back to the
I2C ID table when no firmware match data is available. Every entry
now carries match data, so cdef can no longer be NULL.

Drop the comment above the ID table, as the table is now used for
matching data as well.

Fixes: 2779f4724b2f ("leds: various: use device_get_match_data")
Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use i2c_get_match_data()
 drivers/leds/leds-is31fl32xx.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 285085d27453..5ef4fd649d60 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -574,7 +574,7 @@ static int is31fl32xx_probe(struct i2c_client *client)
 	int count;
 	int ret = 0;
 
-	cdef = device_get_match_data(dev);
+	cdef = i2c_get_match_data(client);
 
 	count = device_get_child_node_count(dev);
 	if (!count)
@@ -611,19 +611,15 @@ static void is31fl32xx_remove(struct i2c_client *client)
 			ERR_PTR(ret));
 }
 
-/*
- * i2c-core (and modalias) requires that id_table be properly filled,
- * even though it is not used for DeviceTree based instantiation.
- */
 static const struct i2c_device_id is31fl32xx_id[] = {
-	{ .name = "is31fl3293" },
-	{ .name = "is31fl3236" },
-	{ .name = "is31fl3236a" },
-	{ .name = "is31fl3235" },
-	{ .name = "is31fl3218" },
-	{ .name = "sn3218" },
-	{ .name = "is31fl3216" },
-	{ .name = "sn3216" },
+	{ "is31fl3293",  (kernel_ulong_t)&is31fl3293_cdef },
+	{ "is31fl3236",  (kernel_ulong_t)&is31fl3236_cdef },
+	{ "is31fl3236a", (kernel_ulong_t)&is31fl3236a_cdef },
+	{ "is31fl3235",  (kernel_ulong_t)&is31fl3235_cdef },
+	{ "is31fl3218",  (kernel_ulong_t)&is31fl3218_cdef },
+	{ "sn3218",      (kernel_ulong_t)&is31fl3218_cdef },
+	{ "is31fl3216",  (kernel_ulong_t)&is31fl3216_cdef },
+	{ "sn3216",      (kernel_ulong_t)&is31fl3216_cdef },
 	{ }
 };
 
-- 
2.56.0

