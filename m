Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794528110;
	b=z/n3Sq4tlNcGVX9qsidkduLLPkPfoWKwCjeZcKDzB37hPJfdE7AWsF6JpUA4ekbDNNV1
	 AmPIb83ax80+m67yFuQPfd6L+ZoMgWGrMZIQ4mXDpTDuwOhidK2gvhiooQSaLmeoyUGPk
	 U2d3cwfm8QhCXeheWtQbJQ53uXOWllnvxOZQQWEbhfhrbY1DC46IWaO4tlrLv1KcPcojG
	 t0iv40fvOY/qhDoohBXXms+k89josL6TakArklEz4QX7qbH4Brxmd7GsbxqizzVFk17lh
	 qSAX84GwklxUFtlV1sKwoodMUiXhW0U/IAXy7wYvOD7XNUOy8R+LzHtfsVf5Io4oO4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528110;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=F3tI5WW7X0e6X9kDP+nteSCgDx/2zInz7PcOy6HfnYU=;
	b=tFUsfLILhNviYodRxcx4xF4tZse3llPxXsJ6XfX+QSDIkoRB4Pm0giVEBtQU7tcHsWIs
	 HZeZ18XoFDyrSWyiMP6yr9r1Fc3t3KhYTXSCVRS9PtJ+l8qXIjXz1EYu4Or6lLP9eA+VV
	 TYlUbBS2V48qL3g4yVoCB6SnISH/KyG/k8COcx0ZbTXM5/EdlHInjphAz52FYo6pWrx6n
	 5eT6KcXsK+vf1YVBrwDmXN9dNsgMLK90h1MjAt/vCksY+CvIrlChYKj/BoI2ArrKTzE6f
	 1aIdEh01tuYcUA48Ae8sSx/jLysgTRP7XbwYF1nIITLkjBe0uoxv9SJnuvBZzMpIKLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiNyb2qh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BED606A339;
	Fri, 13 Nov 2026 00:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiNyb2qh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794528110;
	b=Enrru3xU88+lJwvsb0NyLg2at21TEdOzY/4BrNf39PQ4YFKuX8anUvw5sPgXLuGNqs83
	 bYrGUNbZu2kQUkzs5J6F279FSZY82LhImcwHywquRP78zytXcIGIzDd0eNmk7zxMfEjIm
	 jjESMV1bRoAVCetniHYwntyEU9hEOY9pEVTpzdIQlBd5cpzSC0nfkjMfMtZFqmvsvs0SG
	 pSh7y8gwqgjWwHAVLpt5ZcHyAdfR2OB4oC3w+0gscpTqRJulIvpsf21/fv7IxBouBGlvh
	 QeLKSR1b1lDZcvTcNJ3EyDWQXAIPiMVwFELW9cpSjo9NYIASqinY4UCkGAJZ7s+8N/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794528110;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=F3tI5WW7X0e6X9kDP+nteSCgDx/2zInz7PcOy6HfnYU=;
	b=jo1wAFRq8RouTK71fzd11f9fXni8OgPtl1kS5zI2acgjHqUekx7b+R5MvGVFeLmNNDXz
	 VXTf3neJ0WfRKReNQGXrRVmz/sCquecg8DsxcUXJTO/MLCeKZKDyoJ/ZEOlqXAeltIP+j
	 boMfidahxtEypaDMhKb2E26wVSwsaOinpSTxSbO6rDMEehQ8Pv0zzQf4rogE23TKeGrbS
	 HbOW86WoS4Bn/ZCyet1Im7BoBOAakDp1TdBs+nWHbBQpnUTISNypzWXNXBznuxJel4UGM
	 xVjoWluBI2vadMmti2rD6Bz2eFWKw78fZGY0367CApBA6xDpT6f0VtSk74GGHjQY1VQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D3FF1F000C6;
	Fri, 13 Nov 2026 00:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528110;
	bh=F3tI5WW7X0e6X9kDP+nteSCgDx/2zInz7PcOy6HfnYU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=fiNyb2qhhtV9Mi+v5Y3yYlKHws6+3jLXeqAgP/SIaws3nAPS0iSnWCqZvWhDlB9bd
	 POcJMrnzQU1sH+E72UBPIyOKBJ1Jz29wK2B6BsECvEI9d7Y2bdutzIw6LnLHBkZvpg
	 Kv8aLENLuR0Mjo9Fl040cnL1xFg7B+HsOQxyQw23iEEy36kp9C1eBpfeQ16/qyVpX5
	 mIPDysR2R8SPbB/eJqbYaWOSLhEvB0j1CvRNjtc66gPYECQ/uBnkoXi+3U/ReFcFqd
	 XOdTOAoQ2Q95nUE63td/EW5jOuliYG9dR342km9NU4VeQPMFSTAO6gh0uOssjyPqrz
	 Xnx0L1z6tkzbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 64E1A47559;
	Fri, 13 Nov 2026 00:01:48 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Subject: [PATCH v6 0/3] leds: aw2013: Add AW2027 support
Date: Thu, 12 Nov 2026 17:01:39 -0700
Message-Id: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRTU7DMBAF4KtUXmM0M67jhhX3QCz8M2kt1KTYI
 QRVuTtOQNAFFivrWZpvnjRXkTlFzuJhdxWJp5jj0JfQ3O2EP9n+yDKGkgUBNdCCkfadANX2zLN
 M3Nszy9CRUl63hL4RZfSSuIvzxj49l3yKeRzSx7ZlwvX3H3BCCdK31oQOyRrAx8uQx7NNLzwO+
 X5IR7G6E/1YCKArFhUL4cDelZ7G6IqlbiykiqXWXtZhFwJocE3F2v9aZXPF2kuUB2o0tY7Zaap
 Y+saq9tKllyOvWZGyLdg/rOXrMIlf38qZx+/rLMsnKmKLOwQCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794528107; l=3313;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=w8c/YpWO2vwNEW8lTX4fe+ur30ObhEM9MW5h1gJ1JSM=;
 b=ilLA1ISkHHZZMnGz0jkPOZ1n5UTIuMq4rPE3ejPegZWtWq/iMjbSWA0NQ7VuZDo6SiiBMw85c
 K3n+kmIMr0sDUnT2RSZad91jBzqcKQgaA1ccRoJUmGZtqe76gQIrctF
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org

Refer to PATCH 2 for a full description of the similarities and
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
Paul Sajna (3):
      dt-bindings: leds: aw2013: Add awinic,aw2027 compatible
      leds: aw2013: Add AW2027 support
      leds: aw2013: Use dev_err_probe

 .../devicetree/bindings/leds/leds-aw2013.yaml      |   6 +-
 drivers/leds/leds-aw2013.c                         | 218 +++++++++++++++++----
 2 files changed, 180 insertions(+), 44 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
--  
Paul Sajna <sajattack@postmarketos.org>


