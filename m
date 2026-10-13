Received: from mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF63A7F6B
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870013; cv=none; b=otht6qYph5DeMhWM53RxucCuCXfVS/wGs5dEbb+JKLN7Ir7RRHUHWLOE4XCMhm18Ttqtk8xHIMM88BGYrH32t+7FMQJMqUwZRH8sAybADCPWJlkK/L0XuKQdtP4Cpd9hgpv9Lpe4rcSDiwV/dAFHsSJfHEp6NuHzGFYpPzQhnN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870013; c=relaxed/simple;
	bh=+vIGo2rYMCWNXaBYTBNOtt9+vS9oZuzW7B5Y6OT01T0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NYPpHmJ8woBp+yGLra/kO5IK+oH2o1JpDMF1hXUip80bofqB4tgeiikqebkYFPjXKSNUufDq8LCq0t6B0ZPIAYEQ3bIqslP6b5uy31Rz7ZUU4f0vyG6pRUVLvDcb5HvTD+VuszzMZRaKun+G5zh3k6vSPzf3bXwldRwmWAixKyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=kMEl4XXo; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="kMEl4XXo"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+vIGo2rYMCWNXaBYTBNOtt9+vS9oZuzW7B5Y6OT01T0=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791870006; v=1; x=1792474806;
 b=kMEl4XXoqq8pnV4aZszaJCMsP2CpzTdkjl3REueANxLU4qJuYDF2Cvsid/AyiRnPvUgGFH08
 UtfUw/SgwHQdMSQdUcUXvKyTiqCKD2t33IqTZSj81bw/VHYnzDhT2gRcklp8ZQvH9da5GKvIL5O
 BySnp+DxmUnyEvy3isRpm6b7aHVsjeg+a32Umkvyh3DL5gQM9h2FWd47k2rO1OGMI8VYMoBB5FX
 BckdAp/BhqQK8DpMks8SDgNFjpCoiWAKPWc1mddKd2Iz4hSx6N57JdOQKgPN3cTtC70EIPwcMOv
 XV6oTI6zATtecMatvlYLV8sxwi9/XkoLXrSSjVi4hjbUA==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3e46188e16090fc7;
	Tue, 13 Oct 2026 05:40:06 +0000
X-Mizu-Trace-ID: 3e46188e16090fc7
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v3 0/6] leds: aw2013: Add AW2027 support
Date: Mon, 12 Oct 2026 22:39:54 -0700
Message-Id: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOwQ6CMAwG4FchOzvTdoGJJ9/DeJijwGJgZCOII
 by7g4Mnjafmb/J/7SIiB8dRnLNFBJ5cdL5PQR0yYVvTNyxdlbIgoAJK0NI8CVDtY55l4N50LKu
 alLJ5SWgLkapD4NrNO3u9pdy6OPrw2q9MuG3/gBNKkLY0uqqRjAa8DD6OnQkPHn08+tCIzZ3oY
 yFA/sOiZCGc2N7Tn1rnX6x1Xd/SjeisCwEAAA==
X-Change-ID: 20260907-aw2013-aw20xx-rename-df233c5921c6
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791869999; l=2333;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=+vIGo2rYMCWNXaBYTBNOtt9+vS9oZuzW7B5Y6OT01T0=;
 b=aGDk4R0l4Z9MqEaPODWIkw9++xKyC8b4TgC1LcmSBGH6nWG5FoSP2/7FskzqU1k+kECt6VC7P
 sK+ocrSORbGATxfT0/giYalvC8S6FCksARHWK3vW3ABvxgR620yDdEK
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=

Refer to PATCH 3 for a full description of the similarities and
differences between AW2013 and AW2027.

Several pre-existing bugs were also caught by Sashiko Review
and fixed in this patch-series. The joys of LLM-inflicted bikeshedding.

This PATCH resulted out of discussions pertaining to
sdm660-mainline/linux, a close-to-mainline fork for Qualcomm Snapdragon 660
devices, specifically for the BlackBerry KEY2 Keyboard Backlight,
in the following GitHub PR: https://github.com/sdm660-mainline/linux/pull/218

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v3:
- Drop rename
- Capitalize commit subject
- Other requested commit rewording
- Extra tweaks to cleanup patches (preventing more unbalanced regulator
  stuff)
- Whitespace fiddling for `checkpatch --strict`
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
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nikita Travkin <nikitos.tr@gmail.com>
Cc: Nikita Travkin <nikita@trvn.ru>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Paul Sajna (6):
      dt-bindings: leds: aw2013: Add awinic,aw2027 compatible
      leds: aw2013: Add AW2027 support
      leds: aw2013: Use dev_err_probe
      leds: aw2013: Move assignment of chip->num_leds
      leds: aw2013: Prevent writes to unpowered chip
      leds: aw2013: Move reset register write

 .../devicetree/bindings/leds/leds-aw2013.yaml      |   6 +-
 drivers/leds/leds-aw2013.c                         | 207 ++++++++++++++++-----
 2 files changed, 165 insertions(+), 48 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
--  
Paul Sajna <sajattack@postmarketos.org>

