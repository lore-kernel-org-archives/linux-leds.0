Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794518588;
	b=OpT8n5ms9ghgz2sXnAgsFKSEhGyzY/zfH8OtFB0u2KS09i1HVu7BuUpRxnDyrnmZSMha
	 tEwTDcSzhdJ3wPS+webV2NBtaimj+U/SKfoT96UU9lNXSyWj9ZbXOeIE++7M4asogDv9G
	 bI+J6lQpiAE1lx1T79EA2m2aOMC5MlqHlM0iYuQTb+NOCQQQmuayte1QfXwMHfG7zfg6q
	 sPoFunsmF0ga4SrxGHsKA23aqUZ1x42NA0BMHskH8K994WxTz8fbSt7i5bhTgOqWKiCn0
	 pBkVVXcPbVOnYW0FKuhI0MUa3dV9K2AkQumrlj2PY9NLBXyfjOxiMkGM+9h1fumnqiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518588;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=JZusJj76ohhkq5gfXZKTsCb6m3cFYnTSdrTq9kHDIwM=;
	b=SwsaS8ZmtKysq9LYI50pfr4rxUrXuN7+svsjcCkqojXi53YCCPqUmoADJAGjL65GA14k
	 ISGls3/U5r2iHZ9OEQ+CoLdsS0LXxgjbr7CupIfdTezwQZAG1K5PrtxU/veimEgq+LGkM
	 FkxfyC1AIzDmfCzGmHzQWlGN4GKIyO8+7e1J79duDgfu/j/6Pq9tuURhy8ykQ09OTzXYg
	 pSZLdtRfKXVWqYgwyjHv2QPg9lkzYPgZ3XlwkK05C6Bg241HGI7uNTmvyAVvwAsveKkrp
	 AnvodC8Jfpt6spyP07ovSX3AbgHwHt9e1AWGru4uinVy4Hp8x8YYkf9XqFDQWEKVxgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MtC2brEl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A08606A337;
	Thu, 12 Nov 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MtC2brEl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794518587;
	b=yYtSbZWSsAx3sTKsWWZE/WIeFHFID07RapOwECyUBe3sLIn3xPEB1fb/s5FerAZgHbBg
	 pF4FogFh43Tkz+TZKxHVqTUNBH2jG4orLAW98Fgij5ujn9FVb6A+pxZNpzEcj3vlGACzd
	 /m7zF4cIzSJ77M8OXF/4VqyyiTY+FatDM4y9hNs43xrlj9Ek1+aRWcgfMvBPTUjUGp0RX
	 m7GIjH5dc9qz39syVuK16f4D1aKBKA1CgMJRYgH15YBvyOQF6y8FyvBBuXHRhPy3EIj7v
	 rlHRqn/SvWDU9y81ZFU/SvmnA5OiFITB3xrLSyvR8lyGEAUS2AjZ7k20N6keIPYfKkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794518587;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=JZusJj76ohhkq5gfXZKTsCb6m3cFYnTSdrTq9kHDIwM=;
	b=mRMn8sAqmWlReBgNiS3Hi6y/q6aDHEYrwy+t9HBtfA7tgOWw+Oyn2XoDtIOncVr6L/4c
	 0Z6ahvele/L6udifJv22W1hHu4AXf6WfwvHDYdgKHmEEH/asm71CgvjH/iNRBUN9QAXvS
	 kDhF+eh+/kjHFr8+iaxQQzNbMdUJiYU4I/BjFw1TKngpglDi+w+IJAaQu7N1atiCT2xPn
	 Qpc5v6d/+t7XS6MG0CJjFGxJVDSgufWG6VYuwbnIPCs2rREPK7rmtxF98gdaCRzahxBDk
	 mSI9NK0SfdOm8QIpfxGKhiS3oL+CKdFrJEX7kZfg6zlZXSuj6Bv8I4jGD859mJx6Rdw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B72431F000C4;
	Thu, 12 Nov 2026 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518587;
	bh=JZusJj76ohhkq5gfXZKTsCb6m3cFYnTSdrTq9kHDIwM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=MtC2brEl+bcRg8poBwNegIuHxYHOJEhOpRO8kI6qXwYFinbivGLF1JUuAy7n55N9N
	 vZ4/ioEKLZtnQIEmknv/g1uCyQd74N6S0w/RCcePn0C1VLozus0vnXAOocjvQVWXRz
	 uAEX5Vu3oWqgG4JzDkm1GRJPaBo326hkRiiEVdgldQ6ADhRjjAb2JMIvvGBLICWAXv
	 O/9gOT7q47kGOSspFbw14UujHBCxqi+4A/9mqrTH/+eiFYtVIPYUJ/GD/6dgE+2rRN
	 ccGvY9IPa0KLhEZ483HipiXdC1nXZEcReS0IPnnsEgtjKjvuEkRj7zI/2qEuTH0wPm
	 mq32QFYtGmuDA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 43FF2474FA;
	Thu, 12 Nov 2026 21:23:06 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Subject: [PATCH v5 0/3] leds: aw2013: Add AW2027 support
Date: Thu, 12 Nov 2026 14:22:55 -0700
Message-Id: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRwU7DMAwG4FeZcibIdpZm3Yn3QBySxt0itGYkp
 RRNfXfSgoADESfrt5TPlnMTmVPgLI67m0g8hRziUIK+24nubIcTy+BLFgTUQAtG2jcCVFuZZ5l
 4sBeWvielOt0Sdo0oT6+J+zBv7ONTyeeQx5jetykTrt1/wAklyK61xvdI1gA+XGMeLzY98xjzf
 UwnsboTfVsIoCsWFQvhwJ0rexqjK5b6ZSFVLLXuZR323oMG11Ss/Y9VJlesvUR5oEZT65idpj+
 s5fOYiV9ey9eMXxddlg/hLym1uAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794518585; l=3073;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=ghx1yKBekh/GVJRfqOPS1UW6mRfmE2JnepEDR+3pOo8=;
 b=JaySK5geGCYVAKF4nLZ1ABXHCv8UM0ihMNy1g7Hb1AL8yHFBjBHVyZDGo8rO338MrgSSoA78J
 ZD4QUvo53bQBD9PaQNvvgtk+2bK7sfQSsAa6QaF8aXyfIWwd/JEX6tV
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
 drivers/leds/leds-aw2013.c                         | 175 +++++++++++++++++----
 2 files changed, 146 insertions(+), 35 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
--  
Paul Sajna <sajattack@postmarketos.org>


