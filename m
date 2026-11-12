Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794518587;
	b=YUewyGVFWjY+Xf/kteszKbbkOB/hSu9tJCO1qySa0FQyn1mqTAIizwE4KsBzudrEHnNx
	 93NO3xveArHvnIaSu53Z+CZeO+v4NO/moY8FDUBe4JFwrM5StTYpI50KPA+ZlloIp9AoY
	 0MfrRkqFWJqsQmuTQQEUL8DtxFWXIqjlKKqqmIL/EaZiRfQOcYa0HQukUlC5TIwU370vj
	 EVCUs9fbUJ88TfvguuYcjJUJP34491csLeFUPh4Z26D62iViZ1FUbdtXOkzyB8Hr6YisH
	 JpLimREvS0XGOcefDplwwLUWCdgX25oMkebaHyLLwUl2PhVKh34mw5ITl7eR8JmuSLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518587;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	b=3aw3JsyWFeW/5eCujGE9TAO11Blv5KpjmqrIGb1vrubE+lL861rgnXpcBTeEZXxS3LrY
	 4WucP7EDMbG7YD7lJ/Ufql6vl6gOdVfFL3WJKkcdSU7mXJ2Q8J5c+1h0k4f7+FUBNzuI8
	 bwjv+KkRce86aa6i/T3CEdVLt8qK8hb3iJ7QzTnExiBe/b6M6Di+W08M9VjJPJK1mG5xO
	 J32WTtLWc6SYIS32KfKxUOTcppVll+DHhAsmg1Ent9lG7pWQShfj/V6YlHn07ttu2RqWJ
	 Tb6+8i109n8uf2Fpde4D5XaNlc1/qilB6hw7uDKAADhMTtzWnoVqyeip//lKAf6vd5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Unl3pSA6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9187F606A321;
	Thu, 12 Nov 2026 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Unl3pSA6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794518587;
	b=fykVVOtLZDO8Khr8kZxoNIuHgHRP9q/c1YX9aMZaBsXfDEZMRzQAcjvaEgzcYWPrgmvM
	 DQNNckU2oLyMWNhwwxcVz9ivYRMvTWYYkV1X6j1YdPNQoejuM0RVlfVuLqwHnRT8RVSnD
	 XrxMKUY1o76f0GLs1RBa8BWrqKdO702cGEK3JHOjygZQHKI13rOUzRsni9RBXSXExnyI+
	 bm/vn0eNIWb9K/6CFqxw5jPfKoY22BEGmHRd0lbic6XBN6BeGPloPxtRACWSDJZL9/C2y
	 SsNVAZMM9yfDso2X/xxObH4tqsrA/Lm+J14oWLjP+xCAdUhelHl68BS3rR6MIY2vp+w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794518587;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	b=GA29uu1q2zQzFXKM39Uz/C/6kosGWjyQVBa+BN4/E+uZDaKIx/oqZERwns+H7CK5skgN
	 Zgqq0MNngmNfR6NbEH71n2XAbfp5qFjmCevXmy0WUP3bQ/c1b+TrqWgKcFXWm53Qlt/NW
	 9xM9wLhOVqki1/I+6nn8hSnz/o2a2yHOTCa9lCa6gx3i0+tB5L37HkbC7C8OxYSSqE2Nz
	 PLrCnspbfkcrZG70QMR4/XevKshrbG8cZkEN1D8E+zHzE+y+fWZWx2sWIEYCU2e9XEovf
	 WBEKrcz6LnAV2Ajbtbd6doFOvYAnXsG9QjYOLCcHwWlpM99rO1x/HQBGtNlvhx9mmUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4EF81F000C6;
	Thu, 12 Nov 2026 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518587;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Unl3pSA6LuYn0oO/gVnOp7XqIgSJrg5vfjXhZQ2xtYK45xm8YPPKDIrwjXAcPXpnG
	 bg/KG8fokOiDrIiRCscu2qzMyfoj9YypeEuGF4kpO+tZKQ/DxfvRn9/yv6O1irHTSK
	 KDyNMIYWjBHDcx3CwA8TeUtACxeR2xntIGXFs8M3YHJrpSMjVBJOrIBtcFhBPyngch
	 RBu2P0y0D6NM5c8MS7Oa0A5FkCgfwSplt2ddrtW2NX+rEKb+uE8Ks2Gd2itd4KBDZV
	 EaX3zvkXYOPQ4UtFjRG1mHPPU3bMb3gy4AlBxr08O+lJs6nn9hqZ+Hsw9CKzqpa7YP
	 7p2mzEinVIKpg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E249474FE;
	Thu, 12 Nov 2026 21:23:06 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Thu, 12 Nov 2026 14:22:56 -0700
Subject: [PATCH v5 1/3] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
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
Message-Id: <20261112-aw2013-aw20xx-rename-v5-1-b2c5e323a90a@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
In-Reply-To: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794518585; l=1313;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 b=+n/fssUtnahXhwLA+TPDYrveXzn8paom4T2+5PLDQVoY9xyEsemgj/xnn0qVXDlP7Xgx2FUhU
 zAlRVX5yur/DiRAHYwoRU8Lvh4alLFhycVIX0RftSO2fgXLOIvuU7j5
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org
Content-Transfer-Encoding: 7bit

From: Paul Sajna <sajattack@postmarketos.org>

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index 26238446f2bd..1ad165cfe34a 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW2013/AW2027 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.56.0


