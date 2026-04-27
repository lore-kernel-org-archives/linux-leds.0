Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE4E39EF12
	for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279741; cv=none; b=q4VgNLOjzaG7s5Ku4y21kM1aqQb8hv+DBZI2x1Y4Ed2R9WJ68vSamj8KxEEyePKqxKhE1cv2kYhtCi1KfWK2mc9fQPuw8NibkSXs6cJnuORnwcXVZoQGuOp2yvNjv148JBrF5QDZCwU+iIqXPPuUOVABRpWRYzy2SfVN03vwiGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279741; c=relaxed/simple;
	bh=/C6PhK86fmqsKW/yxs9btw40gjiyNmHMqiUNT4R2AIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I/ASGfGg15gqj9IAzx+Lu0HG+y7swNvey7J4o467QJxFIgNfVQW2Bg4Twn//V0QPO+Kjgyb1kUH7GFClGtFFoyWlKuIEu+Q7KzD0cTubf3Iv03+wkxiahaU9JU2HU/vmRm5YdX+H/icO1/PUAXWYWG3dophoRcnNzZ1I4TfTpd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIhJUmk2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIhJUmk2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2581C19425;
	Mon, 27 Apr 2026 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777279741;
	bh=/C6PhK86fmqsKW/yxs9btw40gjiyNmHMqiUNT4R2AIo=;
	h=From:Date:Subject:To:Cc:From;
	b=qIhJUmk2vE+MyA4JWGLzFBXmI/F5x/+tyGitVYgT761fchWJtirnhbqbx0kAWL+di
	 CBaS9Gr0naFvRgzfVtZemyRZ2LtIEdWQt1KEf84WQCfyj8iFbydFjYaIdbdRDr+TnH
	 WL7sU/mhq/dkf9r7DkjUnjJWEX0eVFoh5QTMAi1V07e+Me9B5+VgQIAvfHcNuNR17u
	 bilC/aPkmcKiEUCzh/9zEsVrP60Boh03nv6r6sjtFmk/eZcFR6Wz60499zzqt0nT/c
	 6/qipC1ev97XqlcSDNCBIcoJELHp3AStH0MYYdlPLSDmzMl3FmcVSX0a+eZGH6W6pS
	 G9wHWL2A4u2BA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 10:48:57 +0200
Subject: [PATCH v2] leds: st1202: Drop unused include
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-leds-st1202-v2-1-119e4cfa6365@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQrDIBBFrxJmXYtjMcGueo+QRatjMjRo0SAtw
 bvXZl3+6j34b4dMiSnDtdshUeHMMTRQpw7scg8zCXaNQUnVy4saxEoui7xhE8Jp36PW3jiL0B6
 vRJ7fR22cGi+ct5g+R7zgz/7vFBRt2qIcrDX+YW5PSoHWc0wzTLXWL0fbpGCnAAAA
X-Change-ID: 20260327-leds-st1202-d5f6155f9dc1
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2

The driver includes the legacy GPIO header <linux/gpio.h> but does
not use any symbols from it so drop the include.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Rebased on v7.1-rc1
- Link to v1: https://lore.kernel.org/r/20260327-leds-st1202-v1-1-15c107cc9fb9@kernel.org
---
 drivers/leds/leds-st1202.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4e5dd76d714d..2b68cd3c45f8 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -9,7 +9,6 @@
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/module.h>

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260327-leds-st1202-d5f6155f9dc1

Best regards,
--  
Linus Walleij <linusw@kernel.org>

