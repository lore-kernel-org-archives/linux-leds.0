Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696941;
	b=DBfwS7BcxT0cXii+77V+c6BFQ3BzUn9tVo+MND4/cFKz2V5ggnNeYJMZYM39VLNz1b8L
	 YPRx+H5GwdMPGnRL/Sqpuz9No4F31y6IDa2wZpuOxIX2eipi3zlpcYE+FBd7LHjurgp+w
	 4RUz55Ape3HpDEAfItZvTrOsLNOfbfFwqFCnVspUUZP1UatftknexRGGTJnNpYxb8CM1f
	 4OHGrhAAuhYzS2t75aTi/zfTeMdXlU7iIUWdFNnFf6t1BwP3/TF0N2KxodCb6PO9DFHm6
	 zTDxir+lZXBU6EyL6oZCdU+Q9ljf1E5M7U5ieXCyj8d2uDZxjTjnEEI2C31xgJcKyPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696941;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LiygG2iGiuebZIwuKX8EIYmY8QCLCyZHFTVPiI3pRFA=;
	b=ecDyX7JCffLMiv5jEktPZLCFO00PZXvOTkVx08WKcWgrF6L4H9Z+zhSU5rAL85f6HE7N
	 RGzEnroCvSuGUtDylkWU7d52bAzR6m8WrPgpRYFQSLV2Aq1vGd+2sUYGUduRVvfMn5Ord
	 fxrC4sOdWOnugFezrpZ6joMeDxlTw1pkdlPHCD420C9iqdliAf/9FG5uXlofZRgML8ybY
	 es5pTSRtKVGnJgRss/92K0BBiWfLgdyDnHlIM9kr9P3JTLooHeSyFIQm3z+IqV/cR+IHO
	 3LmgZpmyL+6w/LcyyerYRYbTXzM2gzDQ6IWlg9/PeEeoiF6xMtagXnDzAHrXURc/FFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=X16kPrQY;
	arc=none smtp.remote-ip=91.218.175.135
Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051D606A327
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 22:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2051D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=X16kPrQY
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RlekjlGNec4ex5TfjWTalwwAb7hHUJ4s1zUc8nIQObA=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696937; v=1; x=1795301737;
 b=X16kPrQY+qbXhd4P/AgXjg5e6qQiF805efMnV+sFxjYh2f2m5sIpMWFikPsc/EydvT7vSlbw
 JQryz1Z6rk2zJ4isyx6b5OecPh5hQQI7PqHoLhP02nqDwwEdFFeXIc/xL2+lBH10E7gWa/3vr6/
 XKVr60BceHPHDPQtEFG+YstKH/+28gWZJ84YdbnqjqMEAuHRB9SuOVGRVAA2mWwbxWtPBeWc+cE
 3I4NlQSvCP+pFRlCbuI3VX1iu19YwcL2W/eCON0kKwbj7zBqgOSwH96DOdMEVlQXk5zeLHG1//I
 wAxC2rebCjNlO68jYDP/V/cFkq/EAncjqP/re4DPXdejQ==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bf42613200098871;
	Sat, 14 Nov 2026 22:55:37 +0000
X-Mizu-Trace-ID: bf42613200098871
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v7 0/4] leds: aw2013: Add AW2027 support
Date: Sat, 14 Nov 2026 15:55:13 -0700
Message-Id: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43RTU7DMBAF4KtEXmfQzDjOT1fcA7GwnUlroTatH
 UJRlbujBARdYMFqpFl870nvppLEIEntipuKMocUxpPaFU1ZKH+wp71A6NWuUIxcY4cN2DdG0tu
 5XiHKyR4F+oG19qZj8rUqC3WOMoTrxj49l4U6hDSN8X1LmWn9/gHOBAi+s00/ENsG6fE8pulo4
 4tMY3oY416t7szfFiGajMWAQNiKd/3ATWMylr6ziDOWXntZR0Pfo0FXZ6zqxyJsM1YFBC3Xhjs
 n4gxnLHNnZXsZQHDsjWjWtkObser/WDUgsCHxVldonf/FWj5HjnJ5DSlMX0svywfWzblLUAIAA
 A==
X-Change-ID: 20260907-aw2013-aw20xx-rename-df233c5921c6
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=3953;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=RlekjlGNec4ex5TfjWTalwwAb7hHUJ4s1zUc8nIQObA=;
 b=1kZVx1fxp3Ybrg4Y6MEb4jvx48u59wsno7wfj2zGt1Ffs4u6YwjEsnC8h6p4DA1d+LoJUdFs2
 dWmJHCuRGMDB2f1JqjZ6QWpOPYMts8c4EFqRRd3+JxxPpBBpCvpcG/c
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Refer to PATCH 4 for a full description of the similarities and
differences between AW2013 and AW2027.

I'm hoping the sashiko reviews about unbalanced regulators that I was
struggling to fix are covered by
https://lore.kernel.org/linux-leds/20261021123406.3163547-1-lee@kernel.org/
and I can drop my failed attempts to fix them.
Let me know if I misunderstood.

I'll do my best to address all of Sashiko's comments, but it might take
me some time to circle back, don't bother reviewing until I've done
this.

This PATCH resulted out of discussions pertaining to
sdm660-mainline/linux, a close-to-mainline fork for Qualcomm Snapdragon 660
devices, specifically for the BlackBerry KEY2 Keyboard Backlight,
in the following GitHub PR: https://github.com/sdm660-mainline/linux/pull/218

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v7:
- Fix multiple imax setting/regulators per Sashiko
- Small description updates to AW20XX per Heidelberg
- Reorder dev_err_probe commit so that introducing new code using
  dev_err_probe is cleaner
- Simplify dev_err_probe, prevent unneccessary assignment
- Revert early return / else suggested by Heidelberg, Travkin and I both
  prefer else
- Lower Hex
- split c99 for-loops to separate commit
- simplify aw2027_set_local_imax and aw2027_set_global_imax
- Link to v6: https://patch.msgid.link/20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org

Changes in v6:
- Fix the compile error introduced by my unchecked hasty rebase
- Some adjustments per David Heidelberg's comments
- Link to v5: https://patch.msgid.link/20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org

Changes in v5:
- Drop move of chip->num_leds
- Make aw2013_microamp_to_imax more readable
- rebase to next-20261112 for Lee's changes
- Link to v4: https://lore.kernel.org/linux-leds/20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org/

Changes in v4:
- Drop sashiko fixes covered by https://lore.kernel.org/linux-leds/20261021123406.3163547-1-lee@kernel.org/
- Rename the chip id register value to reflect that it covers more chips
  (https://www.awinic.com/en/driver/AW2027DNR/640)
- Address preliminary review comments from Lee Jones
- Link to v3: https://lore.kernel.org/r/20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org

Changes in v3:
- Drop rename
- Capitalize commit subject
- Extra tweaks to cleanup patches (preventing more unbalanced regulator
  stuff)
- Whitespace fiddling
- Link to v2: https://lore.kernel.org/r/20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org

Changes in v2:
- Reduce renames to internal driver scope, to prevent breaking compat
- Address Sashiko Review Comments
- Split renames into a separate commit to make the actual changes easier
to identify
- Change from RFC to PATCH
- Link to v1: https://lore.kernel.org/r/20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Griffin Kroah-Hartman <griffin@kroah.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nikita Travkin <nikitos.tr@gmail.com>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Paul Sajna (4):
      dt-bindings: leds: aw2013: Add awinic,aw2027 compatible
      leds: aw2013: Use dev_err_probe
      drivers: leds: aw2013: Leverage C99 for-loops
      leds: aw2013: Add AW2027 support

 .../devicetree/bindings/leds/leds-aw2013.yaml      |   6 +-
 drivers/leds/leds-aw2013.c                         | 240 ++++++++++++++++-----
 2 files changed, 194 insertions(+), 52 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

