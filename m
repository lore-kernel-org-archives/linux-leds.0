Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFB431280D
	for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616324; cv=none; b=V/GB54TNlF0wMKqOrqWtLNaT/M51QdRAccptaQe1aBg3gs4SWzKsE70EPBwxcQEjoomYycZ4Dng3VzarxLBGu0SZ4VYgNuZICUPuZb0lny5zE9X38JbpqVhy8fOctY1MOC8lDZEAg997fL90938btKabF042N10fKngM7Exut34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616324; c=relaxed/simple;
	bh=f1mvCTY2WJinMDbIqwmX3pn1Fs/p0BbCrk+siKXy/aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A+qHYOspHWUvbdqNJgSbUrIdeXQZDEwVUCd4/9GabTtMkoqmP1Kl30SKVj3VGC6ws82ig2oYbjNjdSn4fDnfFv7WUhbT2/yz5mY1JQpNhuFnRoJK2ZPcAjBYyMqaPtGFM9uDeDO14UCANgIBgY2rP/1q+/IL202/ATTuJ/xX7Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3g4qVXX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3g4qVXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5ECC19423;
	Fri, 27 Mar 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774616324;
	bh=f1mvCTY2WJinMDbIqwmX3pn1Fs/p0BbCrk+siKXy/aY=;
	h=From:Date:Subject:To:Cc:From;
	b=V3g4qVXXalMySqfD99oJIysqaUJcaOGQHpMm37GASsvcNMC83/G8K0G6hsuIrhFQE
	 oqSOpGAQEKz8csM5jA1yM8zboQKXfRMUxesraYf0pIKqyzU2mS9bMnOfkEcWnrDty1
	 kNOQqcrnvmrdXtBsci5UowZ9jWMdGWHKliTU0e/G1BlZgx0Y+YNgeUCHxgLJVQLDEJ
	 cy8XntTgptIc4XwX+9xiLdTPJiMsQdxKsBtZcyTgVPIi2GfF8DnoV/ydAm/vp+ok5x
	 g+VwoaeH/AJdnvRemuBj6dtAu0h1BRW9vmegaNQOK3ROdlSZAz5arG5roTO2LdC0YD
	 kAritY/ud6aPQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 13:58:41 +0100
Subject: [PATCH] leds: st1202: Drop unused include
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-leds-st1202-v1-1-15c107cc9fb9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TlBDo74SHULXWggLNyIQ/550n
 IGZAoyZkGESBTI+xHSmBroT4Pc1bSgpNAajjFO9GeSBgSXfugkZbHTa2jgGr6EVV8ZI73+bl1o
 /I6iEdV0AAAA=
X-Change-ID: 20260327-leds-st1202-d5f6155f9dc1
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The driver includes the legacy GPIO header <linux/gpio.h> but does
not use any symbols from it so drop the include.

Signed-off-by: Linus Walleij <linusw@kernel.org>
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
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260327-leds-st1202-d5f6155f9dc1

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

