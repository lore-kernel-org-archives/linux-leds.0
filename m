Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717255;
	b=bawdhm2f0LfQwrSW/VHuoX5uvMHDzm7CjDRAGY3Seq950t7XGFlWLBUIc9O5IAyfGJFQ
	 l/bIfXpQdCfpevnjP3So00qi+54zC0efPJ+cuKAx2XoZ3SZwnv1ZkWXJvBYjCiFfuPd4G
	 uWAwGtt+EyCTcpeE4LdQajpLycHcLdcT0fdkb/+86jjH4add//G8Mg+oAx6YTzZfHtRa3
	 67NP/dLkq8ZQtAgFYX+sEAbi5X5CtnOg/QtX+C6N95uuCcEhctlGZxkoWG8wlsXlLoDci
	 j94z2OYwzGpy0pO67xHOTRDiZmxNEAvOfh7BTwXuprAJhe1R5HTh4Sp2r/qb7RGsXKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717255;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Ogw05hHsTnJ91zRaAKXUyRr0NlZ6+4/CFeX9bCNs/sY=;
	b=OULCoTzO8CDGJhecpSQd2++ffkTODMoOgpJNTy8hXt+O1W8a9EY0NfQfhQhWOJb99AWU
	 EyoQLE/F31cFctGPU9S7yaSGAHQXxsY93unImxWyQdcVGSttjMMdiwX09j7oQ4WgtgwzO
	 z7Z+8Pk9reE29mTsdA0tx7Sg2kmvnHfJPgDp+yBRX+bA6I30syWTD0oeE8/iAaNkGfEXa
	 kHj0+9LbOWyUnWBnpOlqElYYu3DAoM5cORLU2kR6bVqXFd3oXA8MFc18ZXmsEeH9Ddzlj
	 z52HmYO/gFnyI451QwuE5Ygt3Z52+2DLTf9g432Z1TSVgVnzBNt5Vgk+HnHBEWQFciA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z15H9VPC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D8606A31E;
	Thu, 26 Nov 2026 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z15H9VPC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795717255;
	b=V2xgYWf6jZwSdm6yedadwpfpTj1aFnrA47DNzjiNbee065XNb6TbKbZJmDIBapfqch1t
	 JmkDkDlQf9X8lMslkdCItjy/T08hR3Plls+5AUDJT/F+q9TzmRKZaeoOBkudxU+RUAr1W
	 4FhIRnocMghLpnxQ7D7PhlIzgrF0jUBPEAY+9/rLa4Er7yq3I+jukL753i+ZMmjX0PPWU
	 PiYVQ/eVzxEqAam5Dl+0O5GV2WF72+5c8ZAaYH6sPhxM1ehf7IrRjGjUB98hZbkkAdNyQ
	 JxD9919CbU3P8/GcC7LYSvI54JM4aggTeKgx0xwaZBNJPTTkUhXhMds5qMAsVDRjfsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795717255;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Ogw05hHsTnJ91zRaAKXUyRr0NlZ6+4/CFeX9bCNs/sY=;
	b=Ab2DKMVRGkQ28TRNx90pgjkz6OsCH9bCBmjb7sOswF1LCQoVhutIbqTz2iyf4dG8Do8f
	 NwypiJ1VZpDhOgk44y0Hkyt2e5hC1V+0b8GzAN6j7lULaExmqgHZPVbDmxXJkzSQ3Z3mt
	 U53N1w68Qxkl7nQNFWLWiRWYppfcW2kevYY16P/dGJ3pf3DvS2tsRwaG+M6pBpfZxoQLH
	 nSLmflgPOITXii7hc1YJMgnBOksyJe9jbvc2ZYTB/sCTP26uDNyduGVdWcxb822p50dpI
	 BZjEeKlQlB11UcmPdc2oZD3pwkgRiDg15yL+qT3brnhxiuovWd58BpfYv6vfsmlUlWQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6ECF1F000C4;
	Thu, 26 Nov 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795717254;
	bh=Ogw05hHsTnJ91zRaAKXUyRr0NlZ6+4/CFeX9bCNs/sY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Z15H9VPC0DracMwZsLmfOuhxaGe5gMOjQWICYDWeXUAepFJgbjhFARCiSl1E59rAA
	 Fy5YDtbKVlj9HqljHZOTe1uA+YCkLh5EHJO8KfqAEPLpuR0UY42c064Fpo35Wef5Vp
	 cKeX4d8iSrzD6OJiJdbxeMt7or+zrF4owApfvzPJ3brnwmQPX+POIyXYMFlJ6E0GZY
	 I7zpH9RWScuQ4CgHpvFWi6p3iZGkFEDkUWoKW1uYQqNGW0Vk9j6GN2vOEcQZFRc7Zm
	 3iRXS7oHiy6UYgV1wxluKkn5d3d13Cw9aJx+HEfDhIkbrRSTw9ex0433AJHOCmGWul
	 c3X+RNPE8qqew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 13EEB4D78C;
	Thu, 26 Nov 2026 18:20:46 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Subject: [PATCH v8 0/4] leds: aw2013: Add AW2027 support
Date: Thu, 26 Nov 2026 11:20:44 -0700
Message-Id: <20261126-aw2013-aw20xx-rename-v8-0-b6960baa102c@postmarketos.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43SwU7DMAwG4FeZcibIdppk3Yn3QByc1N0qtHWkp
 RRNfXfSgWAHIjhFfyR//g++qEFSJ4PabS4qydQNXX/KYXu3UfHAp73orslZEZCDGrzmNwI012e
 edZITH0U3LRkTbU0Yncqj5yRtN1/Zx6ecD90w9un9umXC9fcPcEINOtbsmxaJPeDDuR/GI6dnG
 fvhvk97tboTfVsIYAsWZQthKzHknt7bgmVuLKSCZdZeHLBtGrAQXMGqfqy8uWBVGvWWnKU6iAR
 LBcveWMVeNvcKFK0YMlwDFyz3H8tliyxKZFMBh1iw/K1VFSyfLWHLBtFw5etfrOXzYJK8vObzG
 7+uZlk+AET2SNCcAgAA
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795717245; l=4284;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=DaMBc1I+vyjS2XIQqBToYqHwD3JDgEqh/8IYfGmPB4s=;
 b=hxfYpf21WjnrxDYcUt46H6Hj7AR2vKFn/OdZ79Nww+IkzPOcS/yRQ1RGoOaXcwcu/Qvj1GVKs
 Ex1ad0/Fpq2Av1pDEK6zEr+JS4M/OsfDX99bHVi1+/N6rGLAsxgDwrt
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org

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
Changes in v8:
- Fix commit subject for c99 for loops commit
- Combine local imax setting for both chips into a single function,
  reduce duplicate loops
- Remove excessive comments
- simplify mutex unlock in aw2013_probe_dt
- Link to v7: https://lore.kernel.org/r/20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org

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
      leds: aw2013: Leverage C99 for-loops
      leds: aw2013: Add AW2027 support

 .../devicetree/bindings/leds/leds-aw2013.yaml      |   6 +-
 drivers/leds/leds-aw2013.c                         | 216 +++++++++++++++------
 2 files changed, 165 insertions(+), 57 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
--  
Paul Sajna <sajattack@postmarketos.org>


