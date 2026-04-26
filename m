Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA52C86D;
	Sun, 26 Apr 2026 00:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161804; cv=none; b=nvxt9Bd52A2JgoERA0hemkVR35Y518Az+BLKZwe99dNr7PpWk9aW8NabkTAYZQQXQrdhTK+htGatOQY4ZGcNvL9JXuv0B6c1iyEH6c+v2L0AqMZaQmUPRMSqvDKUwysb7oJSSdbc4y9KSP3ZoIIsxrkATGUuqA4n1DBsqk7FLCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161804; c=relaxed/simple;
	bh=GOW64MIFW54WMvv2W85Zyih06KRJQro9Ei3KHRgc6bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AgXGD7Tsus5JvmE45bD0Q0KWuvplK1MDhQVtVx+kET54uYoz4EI4oVytkyyxC0ApvErdTF97yymne6PkQayPFImcCqrEBR/iicP4e0nA+B0HdluMZVKu3iNcutpmQEg5SVmjfp+PfkZCSybeg0f+v8ifgHxy5U7PCepPAsCLhqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEyxmOhd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEyxmOhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685FCC2BCB2;
	Sun, 26 Apr 2026 00:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161803;
	bh=GOW64MIFW54WMvv2W85Zyih06KRJQro9Ei3KHRgc6bU=;
	h=From:To:Cc:Subject:Date:From;
	b=vEyxmOhd9majESYArUm4EegVH8ee1bszPB9F1E+NCoQ81B2QT8ou1mRJoYgh7lycS
	 7ruh+oB3LTOXbkvRG0BAXoEo0N99gk5IxTj57HJ8LXrsfYSkVMvJNbjvpNKoP8W23P
	 Ju31TS6qNk8/nUsnP7S9ea8y2+CQ04ngDBJqQOqNOH/c9/Et/zLX3UQFo6XseLfeQ+
	 3BJszZiggfQegwM16hfslg6qe115V7icJ8o93FD7ie9E5fVbaxfy81DZLq2ywXsZii
	 gPYBlVDnkgPNAUjoFpvMpXccONKR+oQaynPLohO8ZfjlzEBPV5aWVhM/C77KYh+vsd
	 LwS9NqjMcSm5A==
From: Sasha Levin <sashal@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: as3668: Fix Kconfig symbol name mismatch in Makefile
Date: Sat, 25 Apr 2026 20:03:21 -0400
Message-ID: <20260426000322.55999-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kconfiglint reports:

  X001: CONFIG_LEDS_AS3668 referenced in Makefile but not defined
        in any Kconfig

The AS3668 LED driver was introduced in
commit c7dd343a3756 ("leds:
as3668: Driver for the ams Osram 4-channel i2c LED driver").
That commit defined the Kconfig symbol as LEDS_OSRAM_AMS_AS3668 in
drivers/leds/Kconfig but used the shorter name LEDS_AS3668 in the
Makefile's obj-* line.

Because the Makefile references CONFIG_LEDS_AS3668 which does not exist,
the driver can never be built — the obj-* line always evaluates to
obj- += leds-as3668.o (empty config), so the object file is never
compiled regardless of what the user selects in menuconfig.

Fix the Makefile to reference the correct Kconfig symbol
CONFIG_LEDS_OSRAM_AMS_AS3668, matching what is defined in
drivers/leds/Kconfig.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 8fdb45d5b4393..7db3768912ca5 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
-obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
+obj-$(CONFIG_LEDS_OSRAM_AMS_AS3668)	+= leds-as3668.o
 obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
-- 
2.53.0

